clear all;
close all;
clc;
%% data
p=[1/2+1i/3;1/2-1i/3;1/3];
n=(0:59).';
k=1:9;
x=repmat((n>=0),1,length(k))+sin(pi*kron(n,k.^-1))+cos(2*pi*kron(n,k.^-1));
%% calc
[b,a]=f_allpass_lkd(p);
y=filter(b,a,x);
for i=k
    subplot(3,3,i);
    stem(n,y(:,i),'o-','markerfacecolor',[0,0,1]);
    xlabel('n (samples)');
    ylabel('Amplitude');
    title(['y_k_=_',num2str(i)]);
end