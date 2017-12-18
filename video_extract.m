function [] = video_extract( watermarked_video,original_video )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
movieObj1=VideoReader(original_video);
movieObj2= VideoReader(watermarked_video); % open file

%I2=imread('em.png');
get(movieObj1); % display all information about movie
get(movieObj2);

nFrames1 = movieObj1.NumberOfFrames;
nFrames2= movieObj2.NumberOfFrames;

if nFrames1==nFrames2
    
    % Read every other frame from this movie.
    for iFrame=1:nFrames1
        I1 = read(movieObj1,iFrame); % get one RGB image
        I2 = read(movieObj2,iFrame);
        I1=imresize(I1,[512 512]);
        if iFrame==100
            imwrite(I1,'original_extract.png');
            imwrite(I2,'embedded_extract.png');
            [me,fi,pa]=Extraction(imread('original_extract.png'),imread('embedded_extract.png'));
            
            fi(fi<125)=0;
            pa(pa<150)=0;
            I=uint8(255 - me);
            %h=fspecial('gaussian',[3,3],0.1);
            I=wiener2(I,[5 5]);
           
            %III=comparision(I,imsharpen(II));
            III=imadjust(I);
            %III=imfilter(III,h);
            III=imadjust(his(III),[0.017 1.0],[0.0 1.0]);
            imwrite(III,'medical_extract.png');
            imwrite(uint8(255-fi),'finger_extract.png');
            imwrite(imadjust(uint8(255-pa)),'patient_extract.png');
            figure,imshow('medical_extract.png');
            figure,imshow('finger_extract.png');
            figure,imshow('patient_extract.png');
            break;
        end
    end
end
% Display image
% Pause a little so we can see the image. If no argument is given, it
% waits until a key is pressed.
end

 


