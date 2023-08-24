function wave2sheet(realwave,fs,directory)
L=length(realwave);
[UB,~]=envelope(realwave,2,'peak');

figure
subplot(2,1,1);
hold on;
plot(realwave,':');
plot(UB);
legend("realwave","Upper Bound");
title("The upper envelope of real signal");

subplot(2,1,2);
hold on;
u=UB-mean(UB);
u=u.*(double(u>0.05));
plot(u,":","Color","r");
title("Separated beats");

[pks, locs]=findpeaks(u);
stem(locs,pks,"Color",[0,0,0]);

locs=[1;locs;L];
pitch=[];
dur=[];
figure
for i=1:length(locs)-2
    dur(i)=(locs(i+2)-i)/fs;
    raw_note=realwave(i:locs(i+2));
    wave2proc=average_noise_reduction(raw_note);
    pitch(i)=spectrum_analysis(wave2proc,2,fs/2,"find");
end

output=[pitch',dur'];
writematrix(output,directory);