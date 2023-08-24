clear all;
close all;
clc;
%% data
b=[0.1,-0.2,1.2,-0.2,0.1];
a=1;
%% calc
figure;
impz(b,a,21);
figure;
freqz(b,a);