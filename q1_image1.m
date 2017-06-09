i=imread('image2.png');
figure
imshow(i);
i= rgb2gray(i);
A=i;
  
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
% For Q 2
%         B(i,j)=min(window);
 
    end
end
%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B=uint8(B);
figure,imshow(B); 
