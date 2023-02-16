clear all
close all
i=imread('coloredChips.png');
%figure;%imshow(i);
imfinfo('coloredChips.png');
m=size(i)
n=i(200:391,400:518,1:3)
imshow(n);