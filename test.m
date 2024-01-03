
img = imread('image.jpg'); 
img = rgb2gray(img);
[r , c] = size(img);
for i = 1:r
X(i,:) = fft(img(i,:));
end
for j = 1:c
Y(:,j) = fft(X(:,j));
end
M = Y;
M = fftshift(M);
img2 = abs(M);
img2 = (img2 - min(min(img2)))./(max(max(img2))).*255;
figure(1)
subplot(2,2,1); 
imshow(img); 
title('Origional image');
subplot(2,2,2);
imshow(img2);
title('Transformed image');

subplot(2,2,3);
improfile(img,[r,0],[0,c]);
ylabel('Pixel Value');
xlabel('Distance');
title('Intensity profile of the given line');


subplot(2,2,4);
improfile(img2,[r,0],[0,c]);
ylabel('pixel value');
xlabel('Distance');
title('Intensity profile of the transformed image');




