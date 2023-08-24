clear all;
close all;
clc;
a=[1];
b=[0.1;-0.2;1.2;-0.2;0.1];
impz(b,a,20);
figure;
freqz(b,a);