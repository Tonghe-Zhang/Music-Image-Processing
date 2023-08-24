function [DC_EC, AC_EC, w, h] = JpegEncode(image, QTAB, DCTAB, ACTAB)

    [h, w] = size(image);
    im0 = double(image) - 128;
    CQ = trans(im0, QTAB);
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

end

function Co = trans(im, QTAB)
    [h, w] = size(im);
    wp = w / 8;
    hp = h / 8;

    C = blockproc(im, [8,8], @(block) zigzag(round(dct2(block.data) ./ QTAB))');
    Co = zeros(64,  wp * hp);

    for i = 1 : hp

        Co(:, (i - 1) * wp + 1 : i * wp) = C((i - 1) * 64 + 1 : i * 64, :);

    end
end

function lin = zigzag(P)
    [w, h] = size(P);
    assert(w == h, "输入的矩阵的形状有误，不是方阵！");
    z2id = zigzagid(w);
    Pc = reshape(P', 1, w * h);
    lin = Pc(z2id);
end

function idx = zigzagid(n)
    idx = zeros(n * n, 1);
    pos = [1, 1, 0];  % 起始位置，方向0右，1下，2左下，3右上
    for cnt = 1 : n * n
        idx(cnt) = n * (pos(1) - 1) + pos(2);
        switch pos(3)
            case 0
                pos(2) = pos(2) + 1;
                if(pos(1) == 1)
                    pos(3) = 2;
                else
                    pos(3) = 3;
                end
             case 1
                 pos(1) = pos(1) + 1;
                 if(pos(2) == 1)
                     pos(3) = 3;
                 else
                    pos(3) = 2;
                 end
             case 2 
                pos(1) = pos(1) + 1;
                pos(2) = pos(2) - 1;
                if (pos(1) == n)
                    pos(3) = 0;
                elseif(pos(2) == 1) 
                    pos(3) = 1;
                end
             case 3 
                pos(1) = pos(1) - 1;
                pos(2) = pos(2) + 1;
                if (pos(1) == 1)
                    pos(3) = 0;
                elseif(pos(2) == n) 
                    pos(3) = 1;
                end
        end
    end
end

function DC_EC = DCencode(DC_im, DCTAB)
    DC_EC = [];
    for blk = 1 : length(DC_im)
        magnitude = DC_im(blk);
        
        category = ceil(log2(abs(magnitude) + 1));
        l = DCTAB(category + 1, 1);
        catehuff = DCTAB(category + 1, 2: l + 1);
        
        if(magnitude > 0)
            magbin = double(dec2bin(magnitude)) - 48;
        
        elseif(magnitude < 0)
            magbin = double(dec2bin(-magnitude)) - 48;
            magbin = ~magbin;
        
        else
            magbin = [];
        
        end
        
        DC_EC = [DC_EC catehuff magbin];
    end 
end

function AC_block = ACencode(AC_vol, ACTAB)
    AC_block = [];
    nnz = find(AC_vol);
    if (isempty(nnz))
        AC_block = [1, 0, 1, 0];
    else
        numofzero = [nnz(1) - 1, diff(nnz) - 1];
        for idx = 1 : length(numofzero)
            run = numofzero(idx);
            amplitude = AC_vol(nnz(idx));         
            if(run >= 16)
                run = run - 16;
                AC_block = [AC_block, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
            end       
            size = ceil(log2(abs(amplitude) + 1));
            rs = find(ACTAB(:,1) == run & ACTAB(:,2) == size);
            l = ACTAB(rs, 3);
            rshuff = ACTAB(rs, 4 :  l + 3);           
            if(amplitude > 0)
                ampbin = double(dec2bin(amplitude)) - 48;        
            elseif(amplitude < 0)
                ampbin = double(dec2bin(-amplitude)) - 48;
                ampbin = ~ampbin;
            end
            AC_block = [AC_block rshuff ampbin];  
        end
        AC_block = [AC_block, 1, 0, 1, 0];   
    end  
end
