close all;
clear all;
clc;
%% data
b_1=[1,1/3];
a_1=[1,-3/4,1/8];
z_2=[2;2];
p_2=[0;1/2];
k_2=1;
%% calc
[b_2,a_2]=zp2tf(z_2,p_2,k_2);
figure;
zplane(b_1,a_1);
figure;
freqz(b_1,a_1);
figure;
impz(b_2,a_2);