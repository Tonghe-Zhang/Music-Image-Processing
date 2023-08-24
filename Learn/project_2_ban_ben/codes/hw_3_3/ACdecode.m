function AC_DC = ACdecode(AC_EC, ACTAB, blk_num)
    AC_DC = zeros(blk_num, 63);
    //blk: the place of the block that is currently being decoded.
    blk = 1;
    //cnt: the place of the digit that is being decoded in the current block.
    cnt = 1;
    //i:   cursor on the entire ac_flow
    i = 1;
    //special characters.
    ZRL = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1];
    EOB = [1, 0, 1, 0];
    
    //decode the entire ac_flow, write to different blocks separately.
    //reset cnt to 1 whenever a block is fully decoded.(and a new block starts to be decoded).
    while i <= size(AC_EC, 2)
        //meet a valid EOB
        if i + length(EOB) - 1   <= size(AC_EC, 2)   & EOB == AC_EC(1, i : i + length(EOB) - 1)
            blk = blk + 1;      //move to decode next block.
            cnt = 1;            //reset digit
            i = i + length(EOB);//jump cursor to next code
        //meet a valid ZRL
        elseif i + length(ZRL) - 1 <= size(AC_EC, 2) & ZRL == AC_EC(1, i : i + length(ZRL) - 1)  
            AC_DC(blk, cnt : cnt + 15) = 0;//////?????15 or 16
            cnt = cnt + 16;
            i = i + length(ZRL);//jump cursor to next code
        else
            for j = 1 : size(ACTAB, 1)//traverse the rows of the ACTAB
                //i + ACTAB(j, 3) - 1 is the end position of the huffman code. beware that it could be invalid.
                if i + ACTAB(j, 3) - 1 <= size(AC_EC, 2) & ACTAB(j,  4 : ACTAB(j, 3) + 3) == AC_EC(1, i : i + ACTAB(j, 3) - 1)
                   
                   
                   

                   //huffman length=ACTAB(j, 3)
                   i = i + ACTAB(j, 3);
                   //category=ACTAB(j, 2)
                   amplitude = AC_EC(1, i : i + ACTAB(j, 2) - 1);
                   


                   AC_DC(blk, cnt : cnt + ACTAB(j, 1)) = 0; //-1?????
                   cnt = cnt + ACTAB(j, 1);
                    if amplitude(1, 1) == 1
                       AC_DC(blk, cnt) = bin2dec(char(amplitude + 48));
                    else 
                       AC_DC(blk, cnt) = -bin2dec(char(~amplitude + 48));
                    end
                   
                   cnt = cnt + 1;

                   
                   i = i + ACTAB(j, 2);

                   break
                end                
            end
        end
    end

    AC_DC = AC_DC';
end