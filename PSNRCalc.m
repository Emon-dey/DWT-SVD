function PSNR_Value = PSNRCalc(X,Xhat)
% I = imread(X); 
% Ihat = imread(Xhat);

I=X;Ihat=Xhat;
% Read the dimensions of the image.
[rows columns ~] = size(I);

% Calculate mean square error.
mse = (double(I(:,:)) - double(Ihat(:,:))) .^ 2;

mse1 = sum(sum(mse)) / (rows * columns);

% Calculate PSNR (Peak Signal to noise ratio).
PSNR_Value = 10 * log10( 255^2 / mse1);
end