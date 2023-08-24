

t=0:0.01:0.6;
sd = sin(80*pi*t)+sin(10*pi*t);
sd1=filter(b,a,sd);
r1=f_deci(sd1,2);
sd2=f_deci(sd,2);
r2=filter(b,a,sd2);
r3=decimate(sd,2);
subplot(4,1,1);
stem(sd);
subplot(4,1,2);
stem(r1);
subplot(4,1,3);
stem(r2);
subplot(4,1,4);
stem(r3);