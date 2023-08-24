clear all,close all,clc;
a=[1,-1.1,0.6];
b=[0.6,-1.1,1];
figure;
subplot(1,2,1);
zplane(b,a);
subplot(1,2,2);
impz(b,a);