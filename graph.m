I = imread('image.jpg');
% Since size(I,2)/2 = 215.5, I have set the value '215' directly for x
x = [215 215];
y = [0 size(I,1)];
c = improfile(I,x,y);
figure
subplot(2,1,1)
imshow(I);
plot(x,y,'r')
subplot(2,1,2)
plot(c(:,1,1),'r')
plot(c(:,1,2),'g')
plot(c(:,1,3),'b')