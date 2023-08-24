clear;
close all;
clc;

load ('../../imgres/hall.mat');

hall_test = double(hall_gray(80:87, 56:63)); % 取块
im = hall_test - 128; 

dctim1 = dct2(im);
dctim2 = my_dct2(im);

fprintf("两种处理方法的误差为%g\n",sum((dctim1 - dctim2).^2, 'all')) % 误差计算