rimg1 = imread('x.jpg'); 
img1 = rgb2gray(rimg1);
[r1 , c1] = size(img1);

for i = 1:r1
X(i,:) = fft(img1(i,:));
end
for j = 1:c1
Y(:,j) = fft(X(:,j));
end

M = Y;
N = Y;
M = fftshift(M);

fimg1 = abs(M);
fimg1 = (fimg1 - min(min(fimg1)))./(max(max(fimg1))).*255;

fimg2 = abs(N);
fimg2 = (fimg2 - min(min(fimg2)))./(max(max(fimg2))).*255;

figure



subplot(1,2,2);
imshow(fimg2);
title('without shifting');

subplot(1,2,1); 
imshow(fimg1); 
title('with shifting');

figure
imshow(rimg1);
