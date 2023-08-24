clear all;
close all;
clc;
%% data
b=[1,-1.1,0.6];
a=[0.6,-1.1,1];
%% calc
figure;
zplane(b,a);
figure;
freqz(b,a);