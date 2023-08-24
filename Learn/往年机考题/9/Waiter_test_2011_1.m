clear all;close all;clc;

%2011年样题第一问
a=[1,-1.1,0.6];
b=[0.6,-1.1,1];
figure;
zplane(b,a);  %绘制零极点图
figure;
impz(b,a); %绘制单位样值响应

%以下为第二问部分
s_1=Waiter_test_generate_s(3);
s_2=Waiter_test_generate_s(77);
r_1=filter(b,a,s_1);
r_2=filter(b,a,s_2);
t=[0:0.05:1];

figure;
subplot(2,2,1);
stem(t,s_1,'.');
xlabel('t');
ylabel('s_-1');
title('s_-1');

subplot(2,2,2);
stem(t,s_2,'.');
xlabel('t');
ylabel('s_-2');
title('s_-2');

subplot(2,2,3);
stem(t,r_1,'.');
xlabel('t');
ylabel('r_-1');
title('r_-1');

subplot(2,2,4);
stem(t,r_2,'.');
xlabel('t');
ylabel('r_-2');
title('r_-2');