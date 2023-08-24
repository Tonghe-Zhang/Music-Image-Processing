
zz=zeros(1,5);pp=zeros(1,5);
[z,p,k]=tf2zp(b,a);
n =0:39;
x = step(n) + sin(pi*n/10)+cos(pi*n/6);
subplot(3,2,1);
[b1,a1]=tf2zp(z,p,k);
filter(b1,a1,x);
for w=1:5;
    zz=f_rotate1(z,20*w);
    pp=f_rotate1(p,20*w);
    [b1,a1] = tf2zp(zz,pp,k);
    %filter(b1,a1,x);
    subplot(3,2,w);
    filter(b1,a1,x);
end