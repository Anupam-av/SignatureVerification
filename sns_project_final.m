rimg1 = imread('x.jpg'); %read image
img1 = rgb2gray(rimg1); % conversion to grayscale
[r1 , c1] = size(img1); % r1 = no of rows ; c1 = no of cols
for i = 1:r1
X(i,:) = fft(img1(i,:));
end                            %fourier transform of each col and then fourier transform of each row
for j = 1:c1
Y(:,j) = fft(X(:,j));
end
M = Y;
M = fftshift(M);              %shift all low frequencies to the center
fimg1 = abs(M);     %abs value is taken because ft has both magnitude and phase but we need only mag
fimg1 = (fimg1 - min(min(fimg1)))./(max(max(fimg1))).*255; %normalise 
figure
subplot(3,2,1); % 3 row 2 col 1 index 
imshow(rimg1); 
title('first image');
subplot(3,2,2);
imshow(fimg1);
title('first transformed image');

rimg2 = imread('t1.jpg'); 
img2 = rgb2gray(rimg2);
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
imshow(rimg2); 
title('second image');
subplot(3,2,4);
imshow(fimg2);
title('second transformed image');



subplot(3,2,5);
p1 = improfile(fimg1,[r1,0],[0,c1]); % plot pixel values on a given line segment
plot(p1);
ylabel('Pixel Value (amplitude)');
xlabel('Distance');
title('Intensity profile of the first tranformed image');


subplot(3,2,6);
p2 = improfile(fimg2,[r2,0],[0,c2]);
plot(p2);
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

[a , b] = size(p1);
res = 0;

for i = 200:300
   
    temp = abs(p1(i)-p2(i));
    
    if(temp<0.08) 
        res = res + 1; 
    end
end


if(res>70)
    
    disp('the signatures match');
    
else
    disp('The signatures does not match');

end



