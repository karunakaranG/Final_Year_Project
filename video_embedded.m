function [] = video_embedded( original_video )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

movieObj = VideoReader(original_video); % open file
writerObj = VideoWriter('myVideo','Uncompressed AVI');
writerObj.FrameRate = 25;

get(movieObj) % display all information about movie
open(writerObj);

nFrames = movieObj.NumberOfFrames;

% Read every other frame from this movie.
for iFrame=1:nFrames
    I = read(movieObj,iFrame); % get one RGB image
%I=imresize(I,[512 512]);
   
 I=imresize(I,[512 512]);

%
    if iFrame==100
        %figure,imshow(I);
       imwrite(I,'original_figure.png');
       It = frame_image(imread('original_figure.png'));
       imwrite(It,'original_embedded.png');
       I=imread('original_embedded.png');
       %I=imread('em.png');
    end
    frame = im2frame(I);
    writeVideo(writerObj, frame);
% Display image
% Pause a little so we can see the image. If no argument is given, it
% waits until a key is pressed.
end

 close(writerObj);

 %combine('myVideo.avi');



end

