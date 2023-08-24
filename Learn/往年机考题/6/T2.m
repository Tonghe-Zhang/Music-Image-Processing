
money1 = 1000000;
stock1 = 1000;    
for i = 2:1545
    if peak(i) >= 1.05 * closing(i-1);
        stock1 = stock1 + 200;
        money1 = money1 - 1.05*closing(i-1)*200*1.002;
    else if nadir(i) <= 0.95 * closing(i-1)
        stock1 = stock1 - min(200,stock1);
        money1 = money1 + min(200,stock1)*0.95*closing(i-1)*0.998;
    
        end
    end
end