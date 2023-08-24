close all
clear
clc


syms t w 
F1 = fourier(t*heaviside(t)) 
F2 = fourier(sin(t))
f = ifourier(dirac(w))