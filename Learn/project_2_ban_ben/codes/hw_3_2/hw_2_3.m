clear;
close all;
clc;

load ('../../imgres/hall.mat');

im = double(hall_gray) - 128;

C0 = blockproc(im, [8, 8], @(block) dct2(block.data));
C1 = blockproc(im, [8, 8], @(block) dct2_ld(block.data));
C2 = blockproc(im, [8, 8], @(block) dct2_rd(block.data));


im0 = uint8(blockproc(C0, [8, 8], @(block) idct2(block.data)) + 128);
im1 = uint8(blockproc(C1, [8, 8], @(block) idct2(block.data)) + 128);
im2 = uint8(blockproc(C2, [8, 8], @(block) idct2(block.data)) + 128);

subplot(2,2,1);
imshow(hall_gray)
title('原始图片')

subplot(2,2,2);
imshow(im0)
title('原始dct还原')

subplot(2,2,3);
imshow(im1)
title('左侧四列置0的dct还原')

subplot(2,2,4);
imshow(im2)
title('右侧四列置0的dct还原')


function C = dct2_ld(P)
    C = my_dct2(P);
    C(:, 1: 4) = 0;
end


function C = dct2_rd(P)
    C = my_dct2(P);
    C(:, end - 3: end) = 0;
end