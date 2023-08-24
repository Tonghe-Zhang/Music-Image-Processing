money1 = 1000000;
stock1 = 1000;    
for i = 2:1545
    if peak(i)>=1.05*closing(i-1)
        
      money1 = money1 + min(200,stock1)*0.998*0.95*closing(i-1);
    stock1 = stock1 - min(200,stock1);
    elseif nadir(i)<=0.95*closing(i-1)
            stock1 =stock1 + 200;
            money1 = money1 - 200*1.002*1.05*closing(i-1);
     end
   
end
cash=1000000;
stock=1000;
rate_fee=0.002;
for i=2:length(opening)
    if(peak(i)>=closing(i-1)*1.05)
        if(stock>=200)
            cash=cash+closing(i-1)*0.95*200*(1-rate_fee);
            stock=stock-200;
        else
            cash=cash+closing(i-1)*0.95*stock*(1-rate_fee);
            stock=0;
        end
    elseif(nadir(i)<=closing(i-1)*0.95)
        cash=cash-closing(i-1)*1.05*200*(1+rate_fee);
        stock=stock+200;
        if(cash<0)
            disp('Err. money runs out.\n');
            return;
        end
    end
end
