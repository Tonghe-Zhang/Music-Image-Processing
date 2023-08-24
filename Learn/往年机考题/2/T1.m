%ccc
z = [-0.4;0.45+0.3j;0.45-0.3j];
p = [0;1+0.6j;1-0.6j];
[b,a]=zp2tf(p,z,1);
sys = tf(b,a);
impz(b,a,0:20);
%stem(t,h);