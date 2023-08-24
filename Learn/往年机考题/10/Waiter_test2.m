clear all; close all; clc;
t=[0:1/1000:1];
x=square(2*pi*5*t);
c=sin(2*pi*400*t);
y=x.*c;
xx=y.*c;

a1=[1];
b1=[0.1 0.2 0.2 0.2 0.2 0.1];
a2=[1];
b2=[0.1 -0.2 0.2 -0.2 0.2 -0.1];
x_r=filter(b1,a1,xx);

subplot(5,1,1);
plot(t,x);
subplot(5,1,2);
plot(t,c);
subplot(5,1,3);
plot(t,y);
subplot(5,1,4);
plot(t,xx);
subplot(5,1,5);
plot(t,x_r);
