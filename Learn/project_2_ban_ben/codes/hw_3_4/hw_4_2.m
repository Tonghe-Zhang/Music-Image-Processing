clear;
close all;
clc;

L = [3, 4, 5];
threshold = [0.42, 0.52, 0.62];
img = imread("../../imgres/guizhou.bmp");
[h, w, ~] = size(img);

for id1 = 1 : 3
    for id2 = 1 : 3
        
        v = zeros(1, 2^(3 * L(id1)));
        for i = 1 : 33
            image = imread("../../imgres/Faces/" + string(i) + ".bmp");
            v = v + nRpro(image, L(id1));
        end
        v = v / 33;
        
        image_pro = face_reco(img, v, threshold(id2), [ceil(h/10), ceil(w/20)], [ceil(h/40), ceil(w/80)], L(id1));
        subplot(3, 3, (id1 - 1)* 3 + id2);
        imshow(image_pro);
        title("L = " + string(L(id1)) + ", threshold =" + string(threshold(id2)));
        
    end
end
