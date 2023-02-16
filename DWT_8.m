clear all
close all
clc

y=imread('watermarked_modified_image1.png');

[xar1,xhr1,xvr1,xdr1]=dwt2(y(:,:,1),'db1');
[xag1,xhg1,xvg1,xdg1]=dwt2(y(:,:,2),'db1');
[xab1,xhb1,xvb1,xdb1]=dwt2(y(:,:,3),'db1');

xa1(:,:,1)=xar1; xa1(:,:,2)=xag1; xa1(:,:,3)=xab1;
xh1(:,:,1)=xhr1; xh1(:,:,2)=xhg1; xh1(:,:,3)=xhb1;
xv1(:,:,1)=xvr1; xv1(:,:,2)=xvg1; xv1(:,:,3)=xvb1;
xd1(:,:,1)=xdr1; xd1(:,:,2)=xdg1; xd1(:,:,3)=xdb1;

i=imread('coloredChips.png');
% figure;imshow(i);

[xar,xhr,xvr,xdr]=dwt2(i(:,:,1),'db1');
[xag,xhg,xvg,xdg]=dwt2(i(:,:,2),'db1');
[xab,xhb,xvb,xdb]=dwt2(i(:,:,3),'db1');

xa(:,:,1)=xar; xa(:,:,2)=xag; xa(:,:,3)=xab;
xh(:,:,1)=xhr; xh(:,:,2)=xhg; xh(:,:,3)=xhb;
xv(:,:,1)=xvr; xv(:,:,2)=xvg; xv(:,:,3)=xvb;
xd(:,:,1)=xdr; xd(:,:,2)=xdg; xd(:,:,3)=xdb;

% figure,imshow(uint8(xa));title('Approximate detail');
% figure,imshow(xh);title('horizontal detail');
% figure,imshow(xv);title('vertical detail');
% figure,imshow(xd);title('diagonal detail');

m=xa;
[a,b,c]=size(m);
for i=1:a
    for j=1:b
        for k=1:c
            if m(i,j,k)<=500 
               m(i,j,k)=m(i,j,k);
            else
                m(i,j,k)=0;
            end
        end
    end
end
% figure;imshow(m);

n=xh;
[a,b,c]=size(n);
for i=1:a
    for j=1:b
        for k=1:c
            if n(i,j,k)>=20 | n(i,j,k)<=60
               n(i,j,k)=n(i,j,k);
            else
                n(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(n);

p=xv;
[a,b,c]=size(p);
for i=1:a
    for j=1:b
        for k=1:c
            if p(i,j,k)>=10 | p(i,j,k)<=100
               p(i,j,k)=p(i,j,k);
            else
                p(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(p);
 
q=xd;
[a,b,c]=size(q);
for i=1:a
    for j=1:b
        for k=1:c
            if q(i,j,k)>=0 | q(i,j,k)<=50
               q(i,j,k)=q(i,j,k);
            else
                q(i,j,k)=0;
            end
        end
    end
end 
% figure;imshow(q);

xa2=xa1+m;
xh2=xh1+n;
xv2=xv1+p;
xd2=xd1+q;

z=idwt2(xa2/255,xh2/255,xv2/255,xd2/255,'db1');
imshow(double(z));
imwrite(z,'watermarked_image1.png','png');