close all;
clear all;
clc;
a=[1,0,0.17];
b=[0.3,0.6,0.3];
impz(b,a);
figure;
freqz(b,a);