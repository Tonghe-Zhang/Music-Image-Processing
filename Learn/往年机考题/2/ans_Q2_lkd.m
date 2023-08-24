clear all;
close all;
clc;
%% data
sys=tf([1,-1],[1,2,-0.2]);
t=0:0.01:10;
%% calc
figure;
impulse(sys,t);
figure;
step(sys,t);