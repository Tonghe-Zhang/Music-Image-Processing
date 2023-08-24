%spectrum_analysis.m
%fn: Nyquist samping frequency
%P:  Power spectrum
function [freq,w,P]=spectrum_analysis(x,n_copy,fn,mode)
%duplicate in time domain.
f=repmat(x,n_copy,1);
%config
N=size(f,1);
T=N/fn;
t_1=1;
dt=floor(T/N);

Omg=floor(2*pi*N/T);
K=N;
w_1=1;
dw=(Omg/K);

t=linspace(t_1,t_1+T-dt,N);
w=linspace(w_1,w_1+Omg-dw,K);

f1=f.*exp(-1i*w_1*t');
F1=fft(f1);
F=(T/N)*exp(1i*w_1*t_1).*exp(-1i*w.*t_1)'.*F1;

P=abs(F).^2;

%find maximum frequency.
P1=P(10:floor(length(P)/4));
[v,arg]=max(P1);
freq=w(arg)/(2*pi);

if mode=="plot"
    figure
    plot(w/(2*pi),P);
    title("spectrum");
    xlabel("frequency(Hz)");
    ylabel("Amplitude");
    set(gca, 'XLim',[0,4000]);
end









