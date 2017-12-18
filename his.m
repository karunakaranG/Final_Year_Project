function [K] = his(image )
%i=rgb2gray(imread('lung1.png'));
%ii=imread('medical_extract.png');

%figure;
%subplot(2,2,1);imshow(i);
%subplot(2,2,2);imhist(i);
%subplot(2,2,3);imshow(ii);
%subplot(2,2,4);imhist(ii);
%imh=imadjust(i,[75,255],[0,255]);
%imh1=histeq(i);
%figure;
%subplot(2,2,1);imshow(imh);title('streched');
%subplot(2,2,2);imhist(imh);
%subplot(2,2,3);imshow(imh1);title('histeq');
%subplot(2,2,4);imhist(imh1);

I= image; % read image
H = padarray(2,[2 2]) - fspecial('gaussian' ,[5 5],0.1); % create unsharp mask % create unsharp mask
%figure,imshow(I);
K = imfilter(I,H);  % create a sharpened version of the image using that mask

end%figure,imshow(K); %showing input & output images