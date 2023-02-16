clear all
close all
clc

i=imread('lena.png');
figure;imshow(i);

[xar,xhr,xvr,xdr]=dwt2(i(:,:,1),'db1');
[xag,xhg,xvg,xdg]=dwt2(i(:,:,2),'db1');
[xab,xhb,xvb,xdb]=dwt2(i(:,:,3),'db1');

xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;

% figure,imshow(uint8(xa));title('Approximate detail');
%  figure,imshow(xh);title('horizontal detail');
% figure,imshow(xv);title('vertical detail');
%  figure,imshow(xd);title('diagonal detail');

m=xa;
[a,b,c]=size(m);
for i=1:a
    for j=1:b
        for k=1:c
            if m(i,j,k)>=500 
               m(i,j,k)=m(i,j,k);
            else
                m(i,j,k)=0;
            end
        end
    end
end
%  figure;imshow(m);

n=xh;
[a,b,c]=size(n);
for i=1:a
    for j=1:b
        for k=1:c
            if n(i,j,k)>=40 && n(i,j,k)<=60
               n(i,j,k)=n(i,j,k);
            else
                n(i,j,k)=0;
            end
        end
    end
end 
%  figure;imshow(n);

p=xv;
[a,b,c]=size(p);
for i=1:a
    for j=1:b
        for k=1:c
            if p(i,j,k)>=1 && p(i,j,k)<=100
               p(i,j,k)=p(i,j,k);
            else
                p(i,j,k)=0;
            end
        end
    end
end 
%  figure;imshow(p);
 
q=xd;
[a,b,c]=size(q);
for i=1:a
    for j=1:b
        for k=1:c
            if q(i,j,k)>=30 && q(i,j,k)<=50
               q(i,j,k)=q(i,j,k);
            else
                q(i,j,k)=0;
            end
        end
    end
end 
%  figure;imshow(q);

y=idwt2(m/255,n/255,p/255,q/255,'db1');
 figure;
 imshow(y);
 imwrite(y,'modified_image.png','png');