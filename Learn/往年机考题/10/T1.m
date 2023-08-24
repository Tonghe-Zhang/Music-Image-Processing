close all;
clear all;
clc;
a=[1];
b1=[0.1,0.2,0.2,0.2,0.2,0.1];
b2=[0.1,-0.2,0.2,-0.2,0.2,-0.1];
freqz(b1,a);
figure;
freqz(b2,a);
%% t2
t=0:1/1000:1-1/1000;
x= square(t*10*pi,50);
c = sin(2*pi*400*t);
y=x.*c;
xx=y.*c;
figure;
subplot(5,1,1);
plot(x);
subplot(5,1,2);
plot(c);
subplot(5,1,3);
plot(y);
subplot(5,1,4);
plot(xx);
subplot(5,1,5);
y=filter(b1,a,xx)
plot(y);
