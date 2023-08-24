clear;
close all;
clc;

P = reshape([1:64], 8, 8);
Pc = zigzag(P);
disp('原矩阵')
disp(P);
disp('扫描结果')
disp(Pc);
