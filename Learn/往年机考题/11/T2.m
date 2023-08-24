close all;
clear all;
clc;
p=[1/2+1i/3;1/2-1i/3;1/3];
[b,a]=f_allpass(p);
freqz(b,a);
figure;
impz(b,a);
for k=1:9
    n=0:59;
    x = stepfun(n,0)+sin(pi*n/k)+cos(2/k*pi*n);
    y=filter(b,a,x);
    subplot(3,3,k);
    stem(y);
end
