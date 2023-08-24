function C = my_dct2(P)
    [h, w] = size(P);
    assert(w == h, "输入的矩阵的形状有误，不是方阵！");
    d1 = 1 : 2 : 2 * w - 1;
    d2 = (1 : w - 1)';
    D = cos(d1 .* d2 * pi / (2 * w));
    D = sqrt(2 / w) * [ones(1,w) * sqrt(1/2); D];
    C = D * P * D';
end
