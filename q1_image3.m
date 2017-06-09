i = imread('image4.png');
figure
imshow(i)
i= rgb2gray(i);
iavg = filter2(fspecial('average',3),i)/255;
 
imedian1 = medfilt2(i);
imedian2=medfilt2(iavg);
figure
imshow(imedian)
b=imsharpen(imedian);
b=imsharpen(b);
A=imedian;
 
   
B=zeros(size(A));
 
%PAD THE MATRIX A WITH ZEROS
modifyA=padarray(A,[1 1]);
 
        x=[1:3]';
        y=[1:3]';
       
for i= 1:size(modifyA,1)-2
    for j=1:size(modifyA,2)-2
      
       %VECTORIZED METHOD 
       window=reshape(modifyA(i+x-1,j+y-1),[],1);
 
       %FIND THE MINIMUM VALUE IN THE SELECTED WINDOW
        B(i,j)=max(window);
 
    end
end
 
 
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
figure,imshow(B);
iwiener = wiener2(i, [5,5]);
