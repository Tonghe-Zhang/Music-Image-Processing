clear all; close all; clc;
a=[1 -1.1 0.6];
b=[0.6 -1.1 1];
figure;
zplane(b,a);
figure;
freqz(b,a);

figure;
n=[0:1:39];
x=(n>=0)+sin(pi*n/10)+cos(pi*n/6);
[z p kk]=tf2zp(b,a);
for k=1:6
    theta=20*k-20;
    zz=f_rotate(z,theta);
    pp=f_rotate(p,theta);
    [bb, aa]=zp2tf(zz,pp,kk);
    y=filter(bb,aa,x);
    subplot(3,2,k);
    plot(y);
end
    


