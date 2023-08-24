clear;
close all;
clc;

load ('../../imgres/snow.mat');
load ('../../imgres/JpegCoeff.mat');
load z2idx

[DC_EC, AC_EC, w, h] = JpegEncode(snow, QTAB, DCTAB, ACTAB);

compression_ratio = w * h * 8 / (length(DC_EC) + length(AC_EC));
fprintf("压缩比为%.3f\n", compression_ratio);

image = JpegDecode(DC_EC, AC_EC, w, h, idx, QTAB, DCTAB, ACTAB);

subplot(1,2,1)
imshow(snow)
title('原图')

subplot(1,2,2)
imshow(image)
title('复原图')

MSE = sum(sum((double(image) - double(snow)).^2)) / (w * h);
PSNR = 10 * log10(255 * 255 / MSE);

fprintf("PSNR为%.3f\n", PSNR);