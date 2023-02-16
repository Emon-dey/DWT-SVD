clear all
close all
clc

i=imread('reconstructed.jpg');
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