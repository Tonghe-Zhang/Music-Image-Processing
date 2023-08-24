function s = generate(frequency)
t=0:1/20:1;
s = heaviside(t)+cos(2*pi*frequency*t);
end