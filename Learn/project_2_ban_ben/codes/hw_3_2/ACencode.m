function AC_block = ACencode(AC_vol, ACTAB)
    AC_block = [];
    nnz = find(AC_vol);
    if (isempty(nnz))
        AC_block = [1, 0, 1, 0];
    else
        numofzero = [nnz(1) - 1, diff(nnz) - 1];
        for idx = 1 : length(numofzero)

            amplitude = AC_vol(nnz(idx));   

            size = ceil(log2(abs(amplitude) + 1));

            run = numofzero(idx);
            if(run >= 16)
                run = run - 16;
                AC_block = [AC_block, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
            end     


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