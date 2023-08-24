close all
clear
clc

%symbolic computing of example 1

syms t x y z1 z2 z3 z4 z5
%.*heaviside(t)
x = sin(2*pi*t).*heaviside(t);
y = exp(-t).*heaviside(t);
%对函数的算数运算用.Op
z1 = 2*x;
z4 = x+y;
z5 = x.*y;

%函数复合使用subs(f,x,phy(x))记号来表示 f(phy(x)).
z2 = subs(x,t,t-0.5);%substitute the 't' in x by 't-0.5'
z3 = subs(x,t,2*t);

x1 = subs(x,t,[-1:0.05:2]);
