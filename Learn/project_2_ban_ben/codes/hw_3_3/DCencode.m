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