clear all;
close all;
clc;
%% data
p=[1/2+1i/3;1/2-1i/3;1/3];
%% calc
[b,a]=f_allpass_lkd(p)
figure;
impz(b,a);
figure;
freqz(b,a);
