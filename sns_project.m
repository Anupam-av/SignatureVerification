
img1 = imread('t1.jpg'); 
img1 = rgb2gray(img1); %convert rgb to greyscale image
[r1 , c1] = size(img1);
for i = 1:r1
X(i,:) = fft(img1(i,:));
end
for j = 1:c1
Y(:,j) = fft(X(:,j));
end
M = Y;
M = fftshift(M);
fimg1 = abs(M);
fimg1 = (fimg1 - min(min(fimg1)))./(max(max(fimg1))).*255;
figure
subplot(3,2,1); 
imshow(img1); 
title('first image');
subplot(3,2,2);
imshow(fimg1);
title('first transformed image');

img2 = imread('t2.jpg'); 
img2 = rgb2gray(img2);
[r2 , c2] = size(img2);
for i = 1:r2
X(i,:) = fft(img2(i,:));
end
for j = 1:c2
Y(:,j) = fft(X(:,j));
end
M = Y;
M = fftshift(M);
fimg2 = abs(M);
fimg2 = (fimg2 - min(min(fimg2)))./(max(max(fimg2))).*255;
subplot(3,2,3); 
imshow(img2); 
title('second image');
subplot(3,2,4);
imshow(fimg2);
title('second transformed image');



subplot(3,2,5);
improfile(fimg1,[r1,0],[0,c1]);
ylabel('Pixel Value (amplitude)');
xlabel('Distance');
title('Intensity profile of the first tranformed image');


subplot(3,2,6);
improfile(fimg2,[r2,0],[0,c2]);
ylabel('pixel value (amplitude)');
xlabel('Distance');
title('Intensity profile of the second transformed image');


figure;hold on;grid on;
plot(improfile(fimg1,[r1,0],[0,c1]));
plot(improfile(fimg2,[r2,0],[0,c2]));
legend({'image1','image2'});
ylabel('pixel value (amplitude)');
xlabel('Distance');
hold off;





