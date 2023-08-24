function s=generate_s(frequency)
t=[0:1/20:1];
u=(t>0);
v=cos(2*pi*frequency*t);
s=u+v;
