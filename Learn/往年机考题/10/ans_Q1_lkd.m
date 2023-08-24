clear all;
close all;
clc;
%% data
b_a=[0.1,0.2,0.2,0.2,0.2,0.1];
a_a=1;
b_b=[0.1,-0.2,0.2,-0.2,0.2,-0.1];
a_b=1;
%% calc
figure;
freqz(b_a,a_a);
figure;
freqz(b_b,a_b);