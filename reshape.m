clear all
close all
clc

i=imread('coloredChips.png');
size(i)
m=rgb2gray(i);
imshow(m);
size(m)
figure
j=m(1,:);
size(j)
imshow(j);
%  k=reshape(j,6,259);
%  figure;imshow(k);


