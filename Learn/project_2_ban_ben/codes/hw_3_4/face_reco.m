function image_pro = face_reco(image, v, threshold, anchor, stride, L)

    [h, w, ~] = size(image);
    candi = zeros(h, w);

    h_anc = anchor(1); % 纵向识别长度
    w_anc = anchor(2); % 横向识别长度

    h_str = stride(1); % 纵向步长
    w_str = stride(2); % 横向步长

    h_itv = ceil(h_anc * 1.1);
    w_itv = ceil(w_anc * 1.1);

    for y = 1 : h_str : h - h_anc + 1
        for x = 1 : w_str : w - w_anc + 1
            % 计算选区
            anchor_piece = image(y : y + h_anc - 1, x : x + w_anc - 1, :); 
            I = nRpro(anchor_piece, L); % 生成特征
            d = 1 - sum(sqrt(I .* v));  % 计算距离
            % 满足阈值，进一步筛选
            if d < threshold
                area = candi(max(y - h_itv, 1) : min(y + h_itv, h), max(x - w_itv, 1) : min(x + w_itv, w)); 
                % 区域内避免重复
                if isempty(find(area, 1))
                    candi(y, x) = d;
                else
                    [yc, xc, dc] = find(area);//x and y coordinates of candidate points and their distances
                    for ic = 1 : length(dc)
                        if d < dc(ic) % 更加接近
                            candi(yc(ic) - 1 + max(y - h_itv, 1), xc(ic) - 1 + max(x - w_itv, 1)) = 0;
                            candi(yc(ic) - 1 + min(y + h_itv, h), xc(ic) - 1 + min(x + w_itv, w)) = 0;
                            candi(y, x) = d;
                        else
                            candi(y, x) = 0;
                        end
                    end
                end
            end
        end
    end


    [up, left] = find(candi);
    down = up + h_anc - 1;
    right = left + w_anc - 1;

    ew = 10; % edge_weight
    anchor_red = logical(zeros(h, w));
    for k = 1 : length(up)
        anchor_red(up(k) : up(k) + ew, left(k) : right(k)) = true;
        anchor_red(max(down(k) - ew, 1): down(k), left(k) : right(k)) = true;
        anchor_red(up(k) : down(k), left(k) : left(k) + ew) = true;
        anchor_red(up(k) : down(k), max(right(k) - ew, 1) : right(k)) = true;
    end
    
    //dye the original image red on the rims.
    r = image(:,:,1);
    g = image(:,:,2);
    b = image(:,:,3);
    r(anchor_red) = uint8(255);
    g(anchor_red) = uint8(0);
    b(anchor_red) = uint8(0);
    
    image_pro = cat(3, r, g, b);

end