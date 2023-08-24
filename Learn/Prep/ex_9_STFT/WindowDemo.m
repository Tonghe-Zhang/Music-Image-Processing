function WindowDemo
close all
clc
global L_WAVE L_FRAME L_OVERLAP L_WINDOW N_FRAME F_Max Fs

L_FRAME = 1024;
L_OVERLAP = L_FRAME/2;
L_WINDOW = L_FRAME + 2*L_OVERLAP;

[data,Fs] = audioread('memory.wav');
data = data(1:Fs*10);
F_Max = round(6000/Fs*L_WINDOW);

L_WAVE = length(data);
N_FRAME = floor(L_WAVE/L_FRAME);

Y = MySpectrogram(data,0);
Y1 = MySpectrogram(data,1);

PlotSpectrum(1,Y);
PlotSpectrum(2,Y1);


end


function Y = MySpectrogram(data,Windowing)
global L_FRAME L_OVERLAP L_WINDOW N_FRAME F_Max

X_Mat = zeros(L_WINDOW/2,N_FRAME);
h = hamming(L_WINDOW);
for n = 1:N_FRAME-1
    if n == 1
        x = zeros(L_WINDOW,1);
        x(L_OVERLAP+1:end) = data(1:L_OVERLAP+L_FRAME);
    else
        x = data((n-1)*L_FRAME+1-L_OVERLAP:n*L_FRAME+L_OVERLAP);
    end
    if Windowing
        x = x.*h;
    end
    X = abs(fft(x,L_WINDOW));
    X_Mat(:,n) = X(1:L_WINDOW/2);
end
Y = log(X_Mat(1:F_Max,:));

end


function PlotSpectrum(id,Y)
global L_WINDOW Fs
figure(1);
subplot(2,1,id);
hold on
h = surf(Y);
set(h,'LineStyle','none');
set(gca,'YTick',round(1000*[0:6]/Fs*L_WINDOW),'YTickLabel',{'0','1000','2000','3000','4000','5000','6000'});
view(0,90);
axis tight
if id == 1
    title('ORIGINAL');
else
    title('WINDOWED');
end
ylabel('FREQUENCY (Hz)');
xlabel('NO. FRAME');
end

