clear all; close all; clc;
a=[1];
b=[0.1 -0.2 1.2 -0.2 0.1];
figure;
h=impz(b,a,20);
stem(h);
title('单位样值响应');
figure;
freqz(b,a);
title('频率特性');

a1=[1];
b1=[-0.05 0.1 0.9 0.1 -0.05];
a2=[1];
b2=[0.4 -0.2 0.6 -0.2 0.4];
figure;
y1=filter(b1,a1,h);
stem(y1);
figure;
y2=filter(b2,a2,h);
stem(y2);