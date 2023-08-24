

%given the current state s
% return the derivative of s (ds/dt)

function ds = myodefun(t,s)
G = 6.672E-11;%gravitation constant
ME = 5.97E24; %mass of the Earth


xy = s(1:2);
vxvy = s(3:4);
r = sqrt(xy'*xy);
ds = [vxvy;-G*ME*xy/r^3];
return