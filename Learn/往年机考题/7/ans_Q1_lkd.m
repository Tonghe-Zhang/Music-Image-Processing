clear all;
close all;
clc;
%% data
b=[0.3,0.6,0.3];
a=[1,0,0.17];
%% calc
figure;
impz(b,a);
figure;
freqz(b,a);
