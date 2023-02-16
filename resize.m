clear all
close all
clc

i=imread('football.jpg');
imshow(i);
w=imresize(i,[392,518]);
figure;imshow(w);

imwrite(w,'football1.jpg','jpg');