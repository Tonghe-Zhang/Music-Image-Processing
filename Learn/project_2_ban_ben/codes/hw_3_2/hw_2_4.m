clear;
close all;
clc;

load ('../../imgres/hall.mat');

im = double(hall_gray) - 128;

C1 = blockproc(im, [8, 8], @(block) dct2_t(block.data));
C2 = blockproc(im, [8, 8], @(block) dct2_90(block.data));
C3 = blockproc(im, [8, 8], @(block) dct2_180(block.data));


im1 = uint8(blockproc(C1, [8, 8], @(block) idct2(block.data)) + 128);
im2 = uint8(blockproc(C2, [8, 8], @(block) idct2(block.data)) + 128);
im3 = uint8(blockproc(C3, [8, 8], @(block) idct2(block.data)) + 128);

subplot(2,2,1);
imshow(hall_gray)
title('原始图片')

subplot(2,2,2);
imshow(im1)
title('转置的dct还原')

subplot(2,2,3);
imshow(im2)
title('旋转90°的dct还原')

subplot(2,2,4);
imshow(im3)
title('旋转180°的dct还原')

function C = dct2_t(P)
    C = my_dct2(P);
    C = C';
end


function C = dct2_90(P)
    C = my_dct2(P);
    C = rot90(C);
end

function C = dct2_180(P)
    C = my_dct2(P);
    C = rot90(C, 2);
end