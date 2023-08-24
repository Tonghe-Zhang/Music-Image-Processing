clear all; close all; clc;
a=[1 1.2 1];
b=[1 1];
sys=tf(b,a);
t=[0:0.01:10];
x=(t>0)-(t>2);
y=lsim(sys,x,t);
figure;
plot(t,y);