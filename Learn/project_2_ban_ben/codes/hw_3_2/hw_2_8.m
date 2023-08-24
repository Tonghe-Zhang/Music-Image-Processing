clear;
close all;
clc;

load ('../../imgres/hall.mat');
load ('../imgres/JpegCoeff.mat');

im = double(hall_gray) - 128;
Co = trans(im, QTAB);
