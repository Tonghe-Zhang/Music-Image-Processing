close all
clear
clc

%% begin record for 5 seconds with 8k Hz sampling rate
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 3);
disp('End of Recording.');

%% retrive speech data and play
myRecording = getaudiodata(recObj);
sound(myRecording);

%% plot in time and frequency domain
figure
spectrogram(myRecording,512,256,512,1E3,'yaxis')
figure
plot(myRecording)