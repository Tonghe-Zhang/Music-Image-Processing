function Co = trans(im, QTAB)
    [h, w] = size(im);
    wp = w / 8;
    hp = h / 8;

    C = blockproc(im, [8,8], @(block) zigzag(round(dct2(block.data)./ QTAB))');
    Co = zeros(64,  wp * hp);   

    for i = 1 : hp

        Co(:, (i - 1) * wp + 1 : i * wp) = C((i - 1) * 64 + 1 : i * 64, :);

    end
end





