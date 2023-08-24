
%file format: "overtones/HZ \tRelative Amplitude"
%P: power spectrum of the signal
%w: frequency sample array.
%file_name: output directory.
%pitch: all the frequencies are the overtone family of pitch.
function write_spectrum(pitch,w,P,file_name)
%neglect low amplitude noises.
P_2=P.*(double(P>0.0003));
%find the peaks in the sound.
[pks,locs]=findpeaks(P_2);
%extract the angular frequencies of corresponding peaks, 
%then convert them to frequencies.
freq=w(locs)/(2*pi);
%normalize the amplitudes. 
pks=pks.*1000;
amp=pks/(sum(pks));
%write frequency-amplitude pairs to file.
fileID = fopen(file_name,'w');
writematrix([freq',amp],file_name,'Delimiter','tab');
fclose(fileID);
end