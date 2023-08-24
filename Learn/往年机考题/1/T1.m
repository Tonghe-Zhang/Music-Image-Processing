clear all;
close all;
clc;
p=[-0.8;0.5+0.5j;0.5-0.5j];
z=[0.1+0.8j;0.1-0.8j;0];
[b,a] = zp2tf(p,z,1);
freqz(b,a);
figure;
impz(b,a,21)