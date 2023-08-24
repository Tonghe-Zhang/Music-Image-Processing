clear;
close all;
clc;
load ('D:\College\4.sophomore_summer\MatLab\Project\Project2\project2\src\hall.mat');
load ('D:\College\4.sophomore_summer\MatLab\Project\Project2\project2\src\JpegCoeff.mat');
[h, w] = size(hall_gray);
im = double(hall_gray) - 128;
CQ = trans(im, QTAB);
%first row of last question's result is the DC coefficients.
DC = CQ(1, :);
DC_im = [DC(1), -diff(DC)];



DC_EC = DCencode(DC_im, DCTAB);



AC = CQ(2:end, :);
AC_EC = [];
for vol = 1 : w * h / 64
    AC_vol = AC(:, vol)';
    AC_block = ACencode(AC_vol, ACTAB);
    AC_EC = [AC_EC AC_block];
end

save jpegcodes DC_EC AC_EC w h

compression_ratio = w * h * 8 / (length(DC_EC) + length(AC_EC));
fprintf("压缩比为%.3f\n", compression_ratio);