clear all, close all, clc;

%use iterative method to solve difference equation
% y(n)-y(n-1)+0.24y(n-2)=x(n)-x(n-1)
% x(n):=n^2 u(n)
a = [1, -1, 0.24];  %coefficients of {y(n)} family.
b = [1, -1];        %coefficients of {x(n)} family.

n = [0:20]';        %u(n) with len=20
x = n.^2;           %x(n)=n^2 u(n)

wi = [-a(3)*(-2)-a(2)*(-1),-a(3)*(-1)];
[y, wf] = filter(b, a, x, wi);

ex_7_1_plot();
