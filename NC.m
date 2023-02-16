% clear all
% close all
% clc
% 
% w=imread('fruits.png');
% ew=imread('EW1atermark.jpg');
% [a,b,c]=size(w);
% for i=1:a
%     for j=1:b 
%         for k=1:c
%             x=(w(i,j,k).*ew(i,j,k));
%            y= (w(i,j,k).^2);
%            norm=mean(x)./mean(y);
%         end
%     end
% end
% norm

clear all
close all
clc

w=imread('fruits.png');

ew=imread('EW2atermark.jpg');
% [a,b,c]=size(w);
wr=w(:,:,1);ewr=ew(:,:,1);
wg=w(:,:,2);ewg=ew(:,:,2);
wb=w(:,:,3);ewb=ew(:,:,3);

xr=reshape(wr',1,203056);
yr=reshape(ewr',1,203056);
norm1=sum(xr.*yr)./sum(xr.^2)

xg=reshape(wg',1,203056);
yg=reshape(ewg',1,203056);
norm2=sum(xg.*yg)./sum(xg.^2)

xb=reshape(wb',1,203056);
yb=reshape(ewb',1,203056);
norm3=sum(xb.*yb)./sum(xb.^2)

nc=(norm1+norm2+norm3)./3


% b=[3 2;4 2];
% for i=1:2
%    for j=1:2
%        norm=sum(a.*b)/sqrt(sum(a.^2).*sum(b.^2));
%    end
% end
% norm
% % norm=sum(a.*b)/sum(a.^2);