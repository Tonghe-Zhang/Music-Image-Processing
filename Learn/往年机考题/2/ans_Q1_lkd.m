clear all;
close all;
clc;
%% data
p=[-0.4;0.45+0.3i;0.45-0.3i];
z=[0;1+0.6i;1-0.6i];
%% calc
[b_1,a_1]=zp2tf(z,p,1);
[b_2,a_2]=zp2tf(p,z,1);
figure;
impz(b_1,a_1,21);
figure;
impz(b_2,a_2,21);