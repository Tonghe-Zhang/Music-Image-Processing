clear;
close all;
clc;

load ('../../imgres/hall.mat');

hall_test = double(hall_gray(80:87, 56:63)); % 取块

im1 = hall_test - 128;  % 原域处理
dctim1 = dct2(im1);

dctim2 = dct2(hall_test); % 变换域处理
dctim2(1,1) = dctim2(1,1) - 128 * 8;


fprintf("两种处理方法的误差为%g\n",sum((dctim1 - dctim2).^2, 'all')) % 误差计算