clear all;
close all;
clc;
%% data
b=[0.6,-1.1,1];
a=[1,-1.1,0.6];
n=(0:39).';
x=stepfun(n,0)+sin(pi*n/10)+cos(pi*n/6);
%% calc
[z,p,k]=tf2zp(b,a);
figure;
for theta=0:20:100
    zz=f_rotate_lkd(z,theta);
    pp=f_rotate_lkd(p,theta);
    [bb,aa]=zp2tf(zz,pp,k);
    y=filter(bb,aa,x);
    subplot(3,2,theta/20+1);
    stem(n,y,'o-','markerfacecolor',[0,0,1]);
    xlabel('n (samples)');
    ylabel('Amplitude');
    title(['y\_rotate',num2str(theta),'^o']);
end