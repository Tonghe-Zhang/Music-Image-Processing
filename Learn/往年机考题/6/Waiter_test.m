clear all; close all; clc;
load stockdata.mat;
figure;
subplot(2,2,1);
plot(opening);
title('开盘价格');
subplot(2,2,2);
plot(closing);
title('收盘价格');
subplot(2,2,3);
plot(peak);
title('当日最高成交价格');
subplot(2,2,4);
plot(nadir);
title('当日最低成交价格');

%投资策略一
money=1000000;
stock=1000;
for k=2:length(date1)
    if(peak(k)>=1.05*closing(k-1))
        stock=stock+200;
        money=money-200*1.05*closing(k-1)*1.002;
    elseif(nadir(k)<=0.95*closing(k-1))
        if(stock>=200)
            stock=stock-200;
            money=money+200*0.95*closing(k-1)*0.998;
        else
            money=money+stock*0.95*closing(k-1)*0.998;
            stock=0;
        end
    end
end
disp(money);
disp(stock);
gain1=money+stock*closing(1545)-(1000000+1000*closing(1));
disp(gain1);

%投资策略二
money=1000000;
stock=1000;
for k=2:length(date1)
    if(nadir(k)<=0.95*closing(k-1))
        stock=stock+200;
        money=money-200*1.05*closing(k-1)*1.002;
    elseif(peak(k)>=1.05*closing(k-1))
        if(stock>=200)
            stock=stock-200;
            money=money+200*0.95*closing(k-1)*0.998;
        else
            money=money+stock*0.95*closing(k-1)*0.998;
            stock=0;
        end
    end
end
disp(money);
disp(stock);
gain2=money+stock*closing(1545)-(1000000+1000*closing(1));
disp(gain2);
            







