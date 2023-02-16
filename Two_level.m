clear all
close all
clc

i=imread('coloredChips.png');
figure;imshow(i);

[xar,xhr,xvr,xdr]=dwt2(i(:,:,1),'db1');
[xag,xhg,xvg,xdg]=dwt2(i(:,:,2),'db1');
[xab,xhb,xvb,xdb]=dwt2(i(:,:,3),'db1');

xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;

[xar2,xhr2,xvr2,xdr2]=dwt2(xh(:,:,1),'db1');
[xag2,xhg2,xvg2,xdg2]=dwt2(xh(:,:,2),'db1');
[xab2,xhb2,xvb2,xdb2]=dwt2(xh(:,:,3),'db1');

xa2(:,:,1)=xar2; xa2(:,:,2)=xag2; xa2(:,:,3)=xab2;
xh2(:,:,1)=xhr2; xh2(:,:,2)=xhg2; xh2(:,:,3)=xhb2;
xv2(:,:,1)=xvr2; xv2(:,:,2)=xvg2; xv2(:,:,3)=xvb2;
xd2(:,:,1)=xdr2; xd2(:,:,2)=xdg2; xd2(:,:,3)=xdb2;

w=imread('fruits.png');
figure;imshow(w);
[war,whr,wvr,wdr]=dwt2(w(:,:,1),'db1');
[wag,whg,wvg,wdg]=dwt2(w(:,:,2),'db1');
[wab,whb,wvb,wdb]=dwt2(w(:,:,3),'db1');

wa(:,:,1)=war; wa(:,:,2)=wag; wa(:,:,3)=wab;
wh(:,:,1)=whr; wh(:,:,2)=whg; wh(:,:,3)=whb;
wv(:,:,1)=wvr; wv(:,:,2)=wvg; wv(:,:,3)=wvb;
wd(:,:,1)=wdr; wd(:,:,2)=wdg; wd(:,:,3)=wdb;

[war2,whr2,wvr2,wdr2]=dwt2(wh(:,:,1),'db1');
[wag2,whg2,wvg2,wdg2]=dwt2(wh(:,:,2),'db1');
[wab2,whb2,wvb2,wdb2]=dwt2(wh(:,:,3),'db1');

wa2(:,:,1)=war2; wa2(:,:,2)=wag2; wa2(:,:,3)=wab2;
wh2(:,:,1)=whr2; wh2(:,:,2)=whg2; wh2(:,:,3)=whb2;
wv2(:,:,1)=wvr2; wv2(:,:,2)=wvg2; wv2(:,:,3)=wvb2;
wd2(:,:,1)=wdr2; wd2(:,:,2)=wdg2; wd2(:,:,3)=wdb2;

[U_imgr,S_imgr,V_imgr]= svd(xhr2);
[U_imgg,S_imgg,V_imgg]= svd(xhg2);
[U_imgb,S_imgb,V_imgb]= svd(xhb2);

[U_wimgr,S_wimgr,V_wimgr]= svd(whr2);
[U_wimgg,S_wimgg,V_wimgg]= svd(whg2);
[U_wimgb,S_wimgb,V_wimgb]= svd(whb2);

S_wimgr1=S_imgr+(0.10*S_wimgr);
S_wimgg1=S_imgg+(0.10*S_wimgg);
S_wimgb1=S_imgb+(0.10*S_wimgb);

%image restoration
wimgr = U_imgr*S_wimgr1*V_imgr';
wimgg = U_imgg*S_wimgg1*V_imgg';
wimgb = U_imgb*S_wimgb1*V_imgb';

wimg=cat(3,wimgr,wimgg,wimgb);
newhost_LH=wimg;
y=idwt2(xa2/255,newhost_LH/255,xv2/255,xd2/255,'db1');
figure;imshow(y);m=imresize(y,[196,259]);
n=idwt2(xa/255,m/255,xv/255,xd/255,'db1');
figure;imshow(n);k=imresize(i,[392,518]);

p=size(k);

M=p(1);

N=p(2);

MSE = sum(sum((double(k)-double(n)).^2))/(M*N);

PSNR = 10*log10(256*256/MSE)
