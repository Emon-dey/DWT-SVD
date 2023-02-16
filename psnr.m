clear all
close all
clc

h1=imread('lena.png');
% h1=imresize(h,[392,518]);
w=imread('watermarked_image.png');


% [filename1,pathname]=uigetfile('*.*','Select the original image'); 
% image1=imread(num2str(filename1));
% [filename2,pathname]=uigetfile('*.*','Select the watermarked image'); 
% image2=imread(num2str(filename2));
% figure(1);
% imshow(image1); title('Original image'); 
% figure(2);
% imshow(image2); title('Watermarked image'); 

[row,col] = size(h1);
size_host = row*col;
o_double = double(h1);
w_double = double(w);
s=0;
for j = 1:size_host; % the size of the original image
s = s+(o_double(j) - w_double(j)).^2 ; 
end
mes=s./size_host;
PSNR =10*log10((255).^2/mes);
display 'Value of',PSNR


 
% if size(h1)~=size(w)
%     error('The images must have the same size');
% end
%  
%if ~isa(X,'double') 
%   X=double(X)./255.00;
%end
%if  ~isa(Y,'double')
%    Y=double(Y)./255.00;
%end
 
% begin
% d1=max(h1(:));
% d2=max(w(:));
% d=max(d1,d2);
% sigma=mean2((h1-w).^2);
%  
% y=10*log10(double(d.^2)./double(sigma))

% n=size(h1);
% 
%  M=n(1);
% 
%  N=n(2);
% 
%  MSE = sum(sum((h1-w).^2))/(M*N);
% 
% PSNR = 10*log10(256*256/MSE)
%  
% PSNR_Value = PSNRCalc(h1,w)

