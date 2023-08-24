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