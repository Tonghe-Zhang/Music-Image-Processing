clear;
close all;
clc;

load ('../../imgres/hall.mat');
[h, w, c] = size(hall_color);

r = min(h, w) / 2; % 半径
circen = [w, h] / 2; % 中心位置
[x,y] = meshgrid(1:w, 1:h);

r_circle = (0.95 * r <= sqrt((x - circen(1)).^2 + (y - circen(2)).^2)) & (sqrt((x - circen(1)).^2 + (y - circen(2)).^2) <= r);
r = hall_color(:,:,1);
g = hall_color(:,:,2);
b = hall_color(:,:,3);
r(r_circle) = uint8(255);
g(r_circle) = uint8(0);
b(r_circle) = uint8(0);
im1 = cat(3, r, g, b);
subplot(1,2,1)
imshow(im1)


pw = round(w/7);
ph = round(h/5);
block = xor(mod(ceil(x/pw), 2), mod(ceil(y/ph), 2));
r = hall_color(:,:,1);
g = hall_color(:,:,2);
b = hall_color(:,:,3);
r(block) = uint8(0);
g(block) = uint8(0);
b(block) = uint8(0);
im2 = cat(3, r, g, b);
subplot(1,2,2)
imshow(im2)
