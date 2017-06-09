I = imread('image1.png');
figure
imshow(I)

Kmedian = medfilt2(I);
figure;
imshow(Kmedian);