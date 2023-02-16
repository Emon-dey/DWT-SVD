clear all
close all
clc

% i=imread('fedexhd.jpg');
% h=imresize(i,[392,518]);
% imshow(h);
% imwrite(h,'fedexhd.png','png');

i=imread('lena.jpeg');
h=imresize(i,[392,518]);
imshow(h);
imwrite(h,'lena.png','png');