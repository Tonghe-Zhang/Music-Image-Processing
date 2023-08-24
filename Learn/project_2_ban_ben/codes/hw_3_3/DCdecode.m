function DC_DC = DCdecode(DC_EC, DCTAB, blk_num)
    DC_DC = zeros(1, blk_num);
    cnt = 1;
    i = 1;

    

    cnt is the number of the decoded digit

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
