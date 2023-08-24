clear all;
close all;
clc;
%% data
p_1=[-0.8;0.5+0.5i;0.5-0.5i];
z_1=[0;1+0.8i;1-0.8i];
b_2=[1,-1];
a_2=[1,-0.2,0.1];
n=(0:20).';
%% calc
[b_1,a_1]=zp2tf(z_1,p_1,1);
[e,n]=impz(b_1,a_1,n);
r=filter(b_2,a_2,e);
stem(n,r,'o','markerfacecolor',[0,0,1]);
xlabel('n (samples)');
ylabel('Amplitude');
title('Response');