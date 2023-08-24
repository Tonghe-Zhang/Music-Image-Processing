clear all; close all; clc;
t=[0:1/100:0.6];
sd=sin(80*pi*t)+sin(10*pi*t);

a=[1 0 0.17];
b=[0.3 0.6 0.3];
rr1=filter(b,a,sd);
r1=f_decim(rr1,2);
rr2=f_decim(sd,2);
r2=filter(b,a,rr2);
r3=decimate(sd,2);

figure;
subplot(4,1,1);
plot(sd);
subplot(4,1,2);
plot(r1);
subplot(4,1,3);
plot(r2);
subplot(4,1,4);
plot(r3);
