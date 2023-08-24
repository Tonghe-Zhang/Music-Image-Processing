clear all;
close all;
clc;
%% data
b_0=[0.1,-0.2,1.2,-0.2,0.1];
a_0=1;
b_1=[-0.05,0.1,0.9,0.1,-0.05];
a_1=1;
b_2=[0.4,-0.2,0.6,-0.2,0.4];
a_2=1;
%% calc
b=conv(b_0,b_1);
a=conv(a_0,a_1);
figure;
impz(b,a,21);
figure;
freqz(b,a);
b=conv(b_0,b_2);
a=conv(a_0,a_2);
figure;
impz(b,a,21);
figure;
freqz(b,a);