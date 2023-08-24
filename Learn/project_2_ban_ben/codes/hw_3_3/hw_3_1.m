clear;
close all;
clc;

load ('../../imgres/hall.mat');
load ('../../imgres/JpegCoeff.mat');
load ('../../hw_3_2/z2idx.mat')

[h, w] = size(hall_gray);

n = 10;
accuracy = zeros(1, n);

for i = 1 : n
    
    info = double(randi([0, 1], h * w, 1));
    
    image_ori = dec2bin(hall_gray);
    image_ori(:, end) = dec2bin(info);
    image = reshape(bin2dec(image_ori), h ,w);

    [DC_EC, AC_EC, w, h] = JpegEncode(image, QTAB, DCTAB, ACTAB);
    image_pro = JpegDecode(DC_EC, AC_EC, w, h, idx, QTAB, DCTAB, ACTAB);
    
    image_pro = dec2bin(image_pro);
    info_pro = bin2dec(image_pro(:, end));
    accuracy(1, i) = length(find(info == info_pro)) / (h * w);
    
end

fprintf('恢复信息准确率为%.2f%%\n', mean(accuracy)*100);