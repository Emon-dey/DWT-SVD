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

w=imread('fruits.png');
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

%extraction
yw1=imread('watermarked_image.png');
yw=imnoise(yw1,'salt & pepper',0.05);
imshow(yw);

[xar2,xhr2,xvr2,xdr2]=dwt2(yw(:,:,1),'db1');
[xag2,xhg2,xvg2,xdg2]=dwt2(yw(:,:,2),'db1');
[xab2,xhb2,xvb2,xdb2]=dwt2(yw(:,:,3),'db1');

xa2(:,:,1)=xar2; xa2(:,:,2)=xag2; xa2(:,:,3)=xab2;
xh2(:,:,1)=xhr2; xh2(:,:,2)=xhg2; xh2(:,:,3)=xhb2;
xv2(:,:,1)=xvr2; xv2(:,:,2)=xvg2; xv2(:,:,3)=xvb2;
xd2(:,:,1)=xdr2; xd2(:,:,2)=xdg2; xd2(:,:,3)=xdb2;

m1=xa2;
[a,b,c]=size(m1);
for i=1:a
    for j=1:b
        for k=1:c
            if m1(i,j,k)>=500 
               m1(i,j,k)=m1(i,j,k);
            else
                m1(i,j,k)=0;
            end
        end
    end
end
% figure;imshow(m1);

n1=xh2;
[a,b,c]=size(n1);
for i=1:a
    for j=1:b
        for k=1:c
            if n1(i,j,k)>=20 && n1(i,j,k)<=60
               n1(i,j,k)=n1(i,j,k);
            else
                n1(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(n1);

p1=xv2;
[a,b,c]=size(p1);
for i=1:a
    for j=1:b
        for k=1:c
            if p1(i,j,k)>=10 && p1(i,j,k)<=100
               p1(i,j,k)=p1(i,j,k);
            else
                p1(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(p1);
 
q1=xd2;
[a,b,c]=size(q1);
for i=1:a
    for j=1:b
        for k=1:c
            if q1(i,j,k)>=0 && q1(i,j,k)<=50
               q1(i,j,k)=q1(i,j,k);
            else
                q1(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(q1);

 yw1=idwt2(m1/255,n1/255,p1/255,q1/255,'db1');
% figure
% imshow(double(yw1));

[xar3,xhr3,xvr3,xdr3]=dwt2(yw1(:,:,1),'db1');
[xag3,xhg3,xvg3,xdg3]=dwt2(yw1(:,:,2),'db1');
[xab3,xhb3,xvb3,xdb3]=dwt2(yw1(:,:,3),'db1');

xa3(:,:,1)=xar3; xa3(:,:,2)=xag3; xa3(:,:,3)=xab3;
xh3(:,:,1)=xhr2; xh3(:,:,2)=xhg3; xh3(:,:,3)=xhb3;
xv3(:,:,1)=xvr3; xv3(:,:,2)=xvg3; xv3(:,:,3)=xvb3;
xd3(:,:,1)=xdr3; xd3(:,:,2)=xdg3; xd3(:,:,3)=xdb3;


[U_imgr3,S_imgr3,V_imgr3]= svd(xdr3);
[U_imgg3,S_imgg3,V_imgg3]= svd(xdg3);
[U_imgb3,S_imgb3,V_imgb3]= svd(xdb3);


S_ewatr=(S_imgr3-S_imgr)/0.10;
S_ewatg=(S_imgg3-S_imgg)/0.10;
S_ewatb=(S_imgb3-S_imgb)/0.10;

ewatr = U_wimgr*S_ewatr*V_wimgr';
ewatg = U_wimgg*S_ewatg*V_wimgg';
ewatb = U_wimgb*S_ewatb*V_wimgb';

ewat=cat(3,ewatr,ewatg,ewatb);

newwatermark_HH=ewat;

%output

rgb2=idwt2(wa,wh,wv,newwatermark_HH,'db1');
figure;imshow(uint8(rgb2));
imwrite(uint8(rgb2),'EW1atermark.jpg');title('Extracted Watermark');
figure
w=imread('fruits.png');
imshow(w);