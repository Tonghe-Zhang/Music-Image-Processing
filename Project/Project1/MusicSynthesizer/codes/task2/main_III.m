%the 
%extract beats and tunes from a raw music and write each note to file.
    load Guitar.MAT
    [guitar_real,fs]=audioread("fmt.wav");
    %sound(guitar_real,fs);
%output directory
    sheet_file="sheet.txt";
    harm_file="harmonic.txt";
    
%generate upper envelope of the sound track.
    L=length(guitar_real);
    resol_thrd=480;%resolution threshold
    [UB,~]=envelope(guitar_real,resol_thrd,'peak');

%plot the time domain graphs.
    figure
    subplot(3,1,1);
    hold on;
    plot(guitar_real,':');
    plot(UB);
    legend("guitar\_real","Upper Bound");
    title("Upper envelope of the real signal");
    xlabel("Sample number");
    ylabel("Intensity");
    subplot(3,1,2);
    hold on;
    u=UB-mean(UB);
    u=u.*(double(u>0.05));
    plot(u,":","Color","r");
    
%find the argmaxs of envelope and plot it.
    [pks, arg]=findpeaks(u);
    stem(arg,pks,"Color",[0,0,0]); 
    caption_beats=sprintf('%d notes are separated from the envelope',1+length(arg));
    title(caption_beats);
    xlabel("Sample number");
    ylabel("Intensity");
    
%construct intervals for each notes from the local maximums.
    subplot(3,1,3);
    interval_len=get_interval(arg);
    intervals=[1:interval_len:L];
    interval_len=get_interval(arg);
    stem(intervals,linspace(0.3,0.3,length(intervals)));
    set(gca,'YLim',[0,0.5]);
    title('Intervals extracted from envelpe');
    xlabel("sample number");

%cut the song into single notes
    LL=length(intervals);
    pitch=[1:1:LL-1];
    dur=pitch;
    plot_width=floor(2*(LL-1)/4)+1;
    figure
    for i=1:LL-1
        raw_note=guitar_real(intervals(i):intervals(i+1));
        dur(i)=length(raw_note)/fs;
        
        %play each note(raw music)
        sound(raw_note,fs);
        
        %pre-process each note, then analyze their spectrums.
        wave2proc=average_noise_reduction(raw_note);
        [pitch(i),w,P]=spectrum_analysis(wave2proc,10,fs/2,"find");
        H=harm(w,P);
        write_overtone_to_file(H,harm_file);
        %plot time domain analysis of each note.
            subplot(1,2,1);%subplot(plot_width,4,2*i);    
            plot(raw_note);
            caption_real = sprintf('Time domain segment \n %2.3f s to %2.3f s',intervals(i)/fs,intervals(i+1)/fs);
            title(caption_real);
            xlabel("Sample number");
            ylabel("Intensity");
        %plot freq domain analysis of each note.
            subplot(1,2,2);%subplot(plot_width,4,2*i);    
            f=w/(2*pi);
            plot(f,P);
            caption = sprintf('%s \n Freq=%2.2f Hz',pitch2formal(pitch(i)),pitch(i));
            title(caption);
            set(gca,'XLim',[0,1000]);
            xlabel("Frequency(Hz)");
            ylabel("Amplitude");
        pause(2);
    end
convert_pitch_duration_to_name_into_file(pitch,dur,sheet_file);

