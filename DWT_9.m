clear all
close all
clc

%host image processing
i=imread('modified_image.png');
[xar,xhr,xvr,xdr]=dwt2(i(:,:,1),'db1');
[xag,xhg,xvg,xdg]=dwt2(i(:,:,2),'db1');
[xab,xhb,xvb,xdb]=dwt2(i(:,:,3),'db1');

xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;


[U_imgr,S_imgr,V_imgr]= svd(xdr);
[U_imgg,S_imgg,V_imgg]= svd(xdg);
[U_imgb,S_imgb,V_imgb]= svd(xdb);

%watermark processing
w=imread('fedexhd.png');
imshow(w);
[war,whr,wvr,wdr]=dwt2(w(:,:,1),'db1');
[wag,whg,wvg,wdg]=dwt2(w(:,:,2),'db1');
[wab,whb,wvb,wdb]=dwt2(w(:,:,3),'db1');

wa(:,:,1)=war; wa(:,:,2)=wag; wa(:,:,3)=wab;
wh(:,:,1)=whr; wh(:,:,2)=whg; wh(:,:,3)=whb;
wv(:,:,1)=wvr; wv(:,:,2)=wvg; wv(:,:,3)=wvb;
wd(:,:,1)=wdr; wd(:,:,2)=wdg; wd(:,:,3)=wdb;

[U_wimgr,S_wimgr,V_wimgr]= svd(wdr);
[U_wimgg,S_wimgg,V_wimgg]= svd(wdg);
[U_wimgb,S_wimgb,V_wimgb]= svd(wdb);

%watermark embedding
S_wimgr1=S_imgr+(0.05*S_wimgr);
S_wimgg1=S_imgg+(0.05*S_wimgg);
S_wimgb1=S_imgb+(0.05*S_wimgb);

%image restoration
wimgr = U_imgr*S_wimgr1*V_imgr';
wimgg = U_imgg*S_wimgg1*V_imgg';
wimgb = U_imgb*S_wimgb1*V_imgb';

wimg=cat(3,wimgr,wimgg,wimgb);
newhost_HH=wimg;
y=idwt2(xa/255,xh/255,xv/255,newhost_HH/255,'db1');
 figure;imshow(y);
 imwrite(y,'watermarked_modified_image2.png','png');