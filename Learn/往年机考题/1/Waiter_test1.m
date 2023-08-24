clear all; close all; clc;
p=[-0.8;0.5+j*0.5;0.5-j*0.5];
z=[0;1+j*0.8;1-j*0.8];
[b a]=zp2tf(z,p,1);
figure;
freqz(b,a);
figure;
impz(b,a,20);
