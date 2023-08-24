clear;
close all;
clc;

L = 4;
threshold = 0.52;
img = imread("../../imgres/guizhou.bmp");
[h, w, ~] = size(img);


v = zeros(1, 2^(3 * L));
for i = 1 : 33
    image = imread("../../imgres/Faces/" + string(i) + ".bmp");
    v = v + nRpro(image, L);
end
v = v / 33;

img1 = imrotate(img, -90);
image_pro1 = face_reco(img1, v, threshold, [ceil(h/10), ceil(w/20)], [ceil(h/40), ceil(w/80)], L);
subplot(1, 3, 1);
imshow(image_pro1);
title('顺时针旋转90°');

img2 = imresize(img, [h, w*2]);
image_pro2 = face_reco(img2, v, threshold, [ceil(h/10), ceil(w/20)], [ceil(h/40), ceil(w/80)], L);
subplot(1, 3, 2);
imshow(image_pro2);
title('伸长2倍');

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
r = uint8(r - 15);
g = uint8(g + 10);
b = uint8(b + 10);
img3 = cat(3, r, g, b);
image_pro3 = face_reco(img3, v, threshold, [ceil(h/10), ceil(w/20)], [ceil(h/40), ceil(w/80)], L);
subplot(1, 3, 3);
imshow(image_pro3);
title('改变颜色');

