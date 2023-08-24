
%% data
p=[-0.8;0.5+0.5i;0.5-0.5i];
z=[0;1+0.8i;1-0.8i];
n=0:20;
%% calc
[b,a]=zp2tf(z,p,1);
figure;
freqz(b,a);
figure;
impz(b,a,21);
%% Q2
clear all;
close all;
clc;
%% data
sys=tf([1,1],[1,1.2,1]);
t=(0:0.1:10).';
x=heaviside(t)-heaviside(t-2);
%% calc
[y,t]=lsim(sys,x,t);
plot(t,y);