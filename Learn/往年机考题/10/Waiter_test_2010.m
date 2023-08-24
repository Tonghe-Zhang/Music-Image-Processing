clear all;close all;clc;

%2010年样题
%以下为第（1）问
a1=1;
b1=[0.1,0.2,0.2,0.2,0.2,0.1];
figure;
freqz(b1,a1);

a2=1;
b2=[0.1,-0.2,0.2,-0.2,0.2,-0.1];
figure;
freqz(b2,a2);

%以下为第（2）问
t=[0:0.001:1];
x=ones(1,length(t));
x(mod(t*1000,200)>=100)=-1;

c=sin(2*pi*400*t);

y=x.*c;
xx=y.*c;

x_r_1=2*filter(b1,a1,xx);
%x_r_2=filter(a2,b2,xx);


figure;
subplot(5,1,1);
plot(t,x);
%xlabel('n');
%ylabel('x(n)');
%title('x(n)');

subplot(5,1,2);
plot(t,c);
%xlabel('n');
%ylabel('c(n)');
%title('c(n)');

subplot(5,1,3);
plot(t,y);
%xlabel('n');
%ylabel('y(n)');
%title('y(n)');

subplot(5,1,4);
plot(t,xx);
%xlabel('n');
%ylabel('xx(n)');
%title('xx(n)');

subplot(5,1,5);
plot(t,x_r_1);
%xlabel('n');
%ylabel('x_-r(n)');
%title('x_-r(n)');