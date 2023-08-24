clear;
close all;
clc;

L = 3;
v = zeros(1, 2^(3 * L));
for i = 1 : 33
    image = imread("../imgres/Faces/" + string(i) + ".bmp");
    v = v + nRpro(image, L);
end
v = v / 33;
subplot(3, 1, 1);
plot([1 : 2^(3 * L)], v);
title("L = 3");

L = 4;
v = zeros(1, 2^(3 * L));
for i = 1 : 33
    image = imread("../imgres/Faces/" + string(i) + ".bmp");
    v = v + nRpro(image, L);
end
v = v / 33;
subplot(3, 1, 2);
plot([1 : 2^(3 * L)], v);
title("L = 4");

L = 5;
v = zeros(1, 2^(3 * L));
for i = 1 : 33
    image = imread("../imgres/Faces/" + string(i) + ".bmp");
    v = v + nRpro(image, L);
end
v = v / 33;
subplot(3, 1, 3);
plot([1 : 2^(3 * L)], v);
title("L = 5");
