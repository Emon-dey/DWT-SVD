clear all
close all
clc
i=imread('coloredChips.png');
figure;imshow(i);
y=size(i)
freqz2(i,391,518,3);