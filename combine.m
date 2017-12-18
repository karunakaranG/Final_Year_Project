function []= combine( video_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


movieObj = VideoReader(video_name); % open file

videoFReader = vision.VideoFileReader(video_name);
AUDIO = dsp.AudioFileReader('audiosound.wav');
videoFWriter = vision.VideoFileWriter('myfile.avi','AudioInputPort',true);

nFrames = movieObj.NumberOfFrames;
for i=1:nFrames
    audioframe=step(AUDIO);
    videoFrame = step(videoFReader);
    
    step(videoFWriter,videoFrame,audioframe);
end
release(videoFReader);
release(videoFWriter);

end

