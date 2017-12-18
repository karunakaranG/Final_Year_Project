function [watermarked ] = frame_image( input_image )
peppers=input_image;
aimg=rgb2gray(imread('lung1.png'));
medical_image=im2double(aimg);
finger_print=im2double(rgb2gray(imread('finger1.png')));
patient_detail=im2double(rgb2gray(imread('patient1.png')));

watermark=Embedded(peppers,medical_image,finger_print,patient_detail);
watermarked=watermark;
figure,imshow(watermarked);

%imwrite(watermarked,'em.png');

%[lung,finger,patient]=Extraction(watermarked_image,peppers);
%figure,imshow(lung);
%figure,imshow(finger);
%figure,imshow(patient);

end

