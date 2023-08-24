clear;
close all;
clc;

load ('../../imgres/hall.mat');
load ('../../imgres/JpegCoeff.mat');
load ('../../hw_3_2/z2idx.mat')

[h, w] = size(hall_gray);
im = double(hall_gray) - 128;
CQ = trans(im, QTAB);

k = ceil(10000/size(CQ, 2));
info = double(randi([0, 1], 10000, 1));
pad = zeros(k * size(CQ, 2) - 10000, 1);
info_seq = cat(1, info, pad);

CQ_ori = dec2bin(CQ);
info_hid_seq = dec2bin(info_seq);
//encrpt each column (each block's zigzag)
for id = 1 : size(CQ, 2)
    CQ_ori(id * 64 - k - 15 : id * 64 - 16, end) = info_hid_seq((id - 1) * k + 1 : id * k, 1);
end 

index = find(CQ_ori(:,1) == '1');
CQ_pro = reshape(bin2dec(CQ_ori), [], 1);
CQ_pro(index) = CQ_pro(index) - 256;
CQ_pro = reshape(CQ_pro, 64, w * h / 64);

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

info_pro_seq = dec2bin(im_DC);
info_pro = zeros(k * size(im_DC, 2) - 10000, 1);
for id = 1 : size(im_DC, 2)
    info_pro((id - 1) * k + 1 : id * k, 1) = bin2dec(info_pro_seq(id * 64 - k - 15 : id * 64 - 16, end));
end 

accuracy = length(find(info == info_pro(1:10000))) / 10000;
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