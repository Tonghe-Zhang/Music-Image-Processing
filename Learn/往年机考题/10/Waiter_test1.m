clear all; close all; clc;
a1=[1];
b1=[0.1 0.2 0.2 0.2 0.2 0.1];
a2=[1];
b2=[0.1 -0.2 0.2 -0.2 0.2 -0.1];
figure;
freqz(b1,a1);
figure;
freqz(b2,a2);