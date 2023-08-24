clear;
close all;
clc;

load ('../../imgres/hall.mat');
load ('../../imgres/JpegCoeff.mat');
load z2idx
load jpegcodes

image = zeros(h, w);
imc = zeros(1, 64);
blk_num = h * w / 64;

DC_DC = DCdecode(DC_EC, DCTAB, blk_num);
AC_DC = ACdecode(AC_EC, ACTAB, blk_num);
im_DC = cat(1, DC_DC, AC_DC);

wb = w/8;
hb = h/8;

for hr = 1 : 1 : hb
    for wr = 1 : 1 : wb
        imc(idx') = im_DC(:, (hr - 1) * wb + wr)';
        im = reshape(imc, 8, 8)';
        im = im .* QTAB;
        im = idct2(im);
        image((8 * hr - 7) : 8 * hr, (8 * wr - 7) : 8 * wr) = im;
    end
end
image = uint8(image + 128);

subplot(1,2,1)
imshow(hall_gray)
title('原图')

subplot(1,2,2)
imshow(image)
title('复原图')

MSE = sum(sum((double(image) - double(hall_gray)).^2)) / (w * h);
PSNR = 10 * log10(255 * 255 / MSE);

fprintf("PSNR为%.3f\n", PSNR);