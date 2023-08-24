function uR = nRpro(image, L)
    uR = zeros(1, 2^(3 * L));
    compratio = 2^(8 - L);
    [h, w, ~] = size(image);
    image = reshape(image, h * w, 3);
    for i = 1 : h * w
        rgb = floor(double(image(i, 1)) / compratio) * 2 ^ (2 * L) + ...
              floor(double(image(i, 2)) / compratio) * 2 ^ L + ...
              floor(double(image(i, 3)) / compratio);
        uR(rgb + 1) = uR(rgb + 1) + 1;
    end
    uR = uR / (h * w);
end