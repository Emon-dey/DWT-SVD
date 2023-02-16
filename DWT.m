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

figure,imshow(xa/255);title('Approximate detail');
figure,imshow(xh);title('horizontal detail');
figure,imshow(xv);title('vertical detail');
figure,imshow(xd);title('diagonal detail');
X1=[xa/255 xv ; xh xd];
figure,imshow(X1);title('Image after 1st level DWT');

size(xa/255)
size(xh)
size(xv)
size(xd)
y=idwt2(xa/255,xh/255,xv/255,xd/255,'db1');
 figure
imshow(y);
 
p=xa/255;
m=p(1:98,1:130,1:3);
n=xh(1:98,130:259,1:3);
l=xv(98:195,1:130,1:3);
k=xd(98:195,130:259,1:3);
 
  figure,imshow(m);
  figure,imshow(n);
  figure,imshow(l);
  figure,imshow(k);
  
X2=[m n ; l k];
figure
imshow(X2);title('Resultant Image after extracting pixels from different bands');
size(X2)
y1=idwt2(m,l/255,n/255,k/255,'db1');
figure
imshow(y1);title('Reconstructed image');
imwrite(y1,'Reconstructed.jpg');