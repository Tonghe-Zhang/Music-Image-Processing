clear all; close all; clc;
a1=[1 -0.75 0.125];
b1=[1 1/3];
figure;
zplane(b1,a1);
figure;
freqz(b1,a1);

p=[0;0.5];
z=[2;2];
[b2 a2]=zp2tf(z,p,1);
figure;
impz(b2,a2);

n=[0:1:39];
e=sin(0.1*pi*n)+cos(1/6*pi*n);
r1=filter(b1,a1,e);
r2=filter(b2,a2,r1);
figure;
subplot(3,1,1);
plot(e);
title('e');
subplot(3,1,2);
plot(r1);
title('r1');
subplot(3,1,3);
plot(r2);
title('r2');