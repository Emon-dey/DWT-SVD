clear all
close all
clc
m=imread('coloredChips.png');
imshow(m);
[a,b,c]=size(m);
for i=1:a
    for j=1:b
        for k=1:c
            if m(i,j,k)>=200
                m(i,j,k)=m(i,j,k);
            else
                m(i,j,k)=0;
            end
        end
    end
end
figure;imshow(m);