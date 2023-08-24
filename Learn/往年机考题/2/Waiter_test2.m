clear all; close all; clc;
a=[1 2 -0.2];
b=[1 -1];
t=[0:0.01:10];
sys=tf(b,a);
figure;
impulse(sys,t);
figure;
step(sys,t);
