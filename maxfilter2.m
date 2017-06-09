%READ AN IMAGE
A = imread('image13.png');
A = rgb2gray(A(1:256,1:256,:));
figure,imshow(A),title('ORIGINAL IMAGE');

%PREALLOCATE THE OUTPUT MATRIX
B=zeros(size(A));

%PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);

        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       %VECTORIZED METHOD
       window=reshape(modifyA(i+x-1,j+y-1),[],1);

       %FIND THE MAXIMUM VALUE IN THE SELECTED WINDOW
        
       B(i,j)=max(window);
   
    end
end

%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
figure,imshow(B),title('IMAGE AFTER MAX FILTERING');

img_filtered = medfilt2(B);
figure; imshow(img_filtered);
title('Portion of the Image with Noise Removed by Median Filter');