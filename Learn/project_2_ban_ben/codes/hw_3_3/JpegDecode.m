function image = JpegDecode(DC_EC, AC_EC, w, h, idx, QTAB, DCTAB, ACTAB)

    image = zeros(h, w);
    imc = zeros(1, 64);
    blk_num = h * w / 64;

    DC_DC = DCdecode(DC_EC, DCTAB, blk_num);
    AC_DC = ACdecode(AC_EC, ACTAB, blk_num);
    im_DC = cat(1, DC_DC, AC_DC);

    wb = w/8;
    hb = h/8;

    for hr = 1 : 1 : hb
        for wr = 1 : 1 : wb
            imc(idx') = im_DC(:, (hr - 1) * wb + wr)';
            im = reshape(imc, 8, 8)';
            im = im .* QTAB;
            im = idct2(im);
            image((8 * hr - 7) : 8 * hr, (8 * wr - 7) : 8 * wr) = im;
        end
    end
    image = uint8(image + 128);

end

function DC_DC = DCdecode(DC_EC, DCTAB, blk_num)
    DC_DC = zeros(1, blk_num);
    cnt = 1;
    i = 1;
    while i <= size(DC_EC, 2)
        for j = 1 : size(DCTAB, 1)
            if DCTAB(j,  2 : DCTAB(j, 1) + 1) == DC_EC(1, i : i + DCTAB(j, 1) - 1)
                i = i + DCTAB(j, 1);
                category = j - 1;
                if category == 0
                   DC_DC(1, cnt) = 0;
                   cnt = cnt + 1;
                else
                   magnitude = DC_EC(1, i : i + category - 1);
                   if magnitude(1, 1) == 1
                       DC_DC(1, cnt) = bin2dec(char(magnitude + 48));
                       cnt = cnt + 1;
                   else 
                       DC_DC(1, cnt) = -bin2dec(char(~magnitude + 48));
                       cnt = cnt + 1;
                   end
                end
                i = i + category;
                break
            end
        end
    end
    for n = 2 : blk_num
        DC_DC(1, n) = DC_DC(1, n - 1) - DC_DC(1, n);
    end
end

function AC_DC = ACdecode(AC_EC, ACTAB, blk_num)
    AC_DC = zeros(blk_num, 63);
    blk = 1;
    cnt = 1;
    i = 1;
    ZRL = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
    EOB = [1, 0, 1, 0];
    
    while i <= size(AC_EC, 2)
        if EOB == AC_EC(1, i : i + length(EOB) - 1)
            cnt = 1;
            i = i + length(EOB);
            blk = blk + 1;
        elseif i + length(ZRL) - 1 <= size(AC_EC, 2) & ZRL == AC_EC(1, i : i + length(ZRL) - 1)  
            AC_DC(blk, cnt : cnt + 16) = 0;
            cnt = cnt + 16;
            i = i + length(ZRL);
        else
            for j = 1 : size(ACTAB, 1)
                if i + ACTAB(j, 3) - 1 <= size(AC_EC, 2) & ACTAB(j,  4 : ACTAB(j, 3) + 3) == AC_EC(1, i : i + ACTAB(j, 3) - 1)
                   i = i + ACTAB(j, 3);
                   AC_DC(blk, cnt : cnt + ACTAB(j, 1)) = 0;
                   cnt = cnt + ACTAB(j, 1);
                   amplitude = AC_EC(1, i : i + ACTAB(j, 2) - 1);
                   if amplitude(1, 1) == 1
                       AC_DC(blk, cnt) = bin2dec(char(amplitude + 48));
                       cnt = cnt + 1;
                   else 
                       AC_DC(blk, cnt) = -bin2dec(char(~amplitude + 48));
                       cnt = cnt + 1;
                   end
                   i = i + ACTAB(j, 2);
                   break
                end                
            end
        end
    end
    AC_DC = AC_DC';
end