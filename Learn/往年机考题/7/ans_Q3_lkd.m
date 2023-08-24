clear all;
close all;
clc;
%% data
b=[0.3,0.6,0.3];
a=[1,0,0.17];
t=(0:1/100:0.6).';
sd=sin(80*pi*t)+sin(10*pi*t);
%% calc
r1=f_decim_lkd(filter(b,a,sd),2);
r2=filter(b,a,f_decim_lkd(sd,2));
r3=decimate(sd,2);
%% graph
figure;
subplot(4,1,1);
plot(t,sd,'o-','markerfacecolor',[0,0,1]);
xlabel('t (samples)');
ylabel('Amplitude');
title('sd');
subplot(4,1,2);
plot(f_decim_lkd(t,2),r1,'o-','markerfacecolor',[0,0,1]);
xlabel('t (samples)');
ylabel('Amplitude');
title('r_1');
subplot(4,1,3);
plot(f_decim_lkd(t,2),r2,'o-','markerfacecolor',[0,0,1]);
xlabel('t (samples)');
ylabel('Amplitude');
title('r_2');
subplot(4,1,4);
plot(f_decim_lkd(t,2),r3,'o-','markerfacecolor',[0,0,1]);
xlabel('t (samples)');
ylabel('Amplitude');
title('r_3');
