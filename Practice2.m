clear all
close all
i=imread('coloredChips.png');
figure;imshow(i);

[xar,xhr,xvr,xdr]=dwt2(i(:,:,1),'db1');
[xag,xhg,xvg,xdg]=dwt2(i(:,:,2),'db1');
[xab,xhb,xvb,xdb]=dwt2(i(:,:,3),'db1');

xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;

% figure,imshow(xa/255);
% figure,imshow(xh)
% figure,imshow(xv);
% figure,imshow(xd);
% X1=[xa/255 xv ; xh xd];
% figure,imshow(X1);

grayImage1 = rgb2gray(uint8(xa));
grayImage2 = rgb2gray(xh);
grayImage3 = rgb2gray(xv);
grayImage4 = rgb2gray(xd);

subplot(1,2,1);
imshow(grayImage1);
axis on;
ft1 = fftshift(log(abs(fft2(grayImage1))));
subplot(1,2,2);
imshow(ft1, []);
axis on;

figure;
subplot(1,2,1);
imshow(grayImage2);
axis on;
ft2 = fftshift(log(abs(fft2(grayImage2))));
subplot(1,2,2);
imshow(ft2, []);
axis on;

figure;
subplot(1,2,1);
imshow(grayImage3);
axis on;
ft3 = fftshift(log(abs(fft2(grayImage3))));
subplot(1,2,2);
imshow(ft2, []);
axis on;

figure;
subplot(1,2,1);
imshow(grayImage4);
axis on;
ft4 = fftshift(log(abs(fft2(grayImage4))));
subplot(1,2,2);
imshow(ft4, []);
axis on;