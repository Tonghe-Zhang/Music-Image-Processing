
n = 0:39;
e = sin(pi*n/10) + cos(1/6*pi*n);
a=conv(a1,a2);
b=conv(b1,b2);
r = filter(b,a,e);
r_1 = filter(b1,a1,e);
subplot(3,1,1);
stem(e);
subplot(3,1,2);
stem(r_1);
subplot(3,1,3);
stem(r);
