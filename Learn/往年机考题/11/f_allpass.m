function [b,a] = f_allpass(p)
an = angle(p);
c = abs(p);
z = 1./c .* exp(1i*(an));
[b,a] = zp2tf(z,p,1);