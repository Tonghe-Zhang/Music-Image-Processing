clear;
close all;
clc;

load ('../../imgres/hall.mat');
load ('../../imgres/JpegCoeff.mat');
load ('../../hw_3_2/z2idx.mat')

[h, w] = size(hall_gray);
im = double(hall_gray) - 128;
CQ = trans(im, QTAB);

//encode information in {-1,1}
//0:-1
//1: 1
info_seq = double(randi([0, 1], 1, w * h / 64));
info_seq = info_seq * 2 - 1;

CQ_pro = CQ;
for vol = 1 : w * h / 64
    index = find(CQ_pro(:, vol));
    if index(end) == 64
        CQ_pro(64, vol) = info_seq(1, vol);
    else
        CQ_pro(index(end) + 1, vol) = info_seq(1, vol);
    end
end 














DC = CQ_pro(1, :);
DC_im = [DC(1), -diff(DC)];
DC_EC = DCencode(DC_im, DCTAB);

AC = CQ_pro(2:end, :);
AC_EC = [];
for vol = 1 : w * h / 64
    AC_vol = AC(:, vol)';
    AC_block = ACencode(AC_vol, ACTAB);
    AC_EC = [AC_EC AC_block];
end

compression_ratio = w * h * 8 / (length(DC_EC) + length(AC_EC));
fprintf("压缩比为%.3f\n", compression_ratio);

image = zeros(h, w);
imc = zeros(1, 64);
blk_num = h * w / 64;

DC_DC = DCdecode(DC_EC, DCTAB, blk_num);
AC_DC = ACdecode(AC_EC, ACTAB, blk_num);
im_DC = cat(1, DC_DC, AC_DC);

info_pro = zeros(1, w * h / 64);
for vol = 1 : w * h / 64
    index = find(im_DC(:, vol));
    info_pro(1, vol) = im_DC(index(end), vol);
end 

accuracy = length(find(info_seq == info_pro)) / (w * h / 64);
fprintf("恢复信息准确率为%.2f%%\n", accuracy * 100);

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

MSE = sum(sum((double(image) - double(hall_gray)).^2)) / (w * h);
PSNR = 10 * log10(255 * 255 / MSE);

fprintf("PSNR为%.3f\n", PSNR);

subplot(1,2,1)
imshow(hall_gray)
title('原图')

subplot(1,2,2)
imshow(image)
title('信息图')
