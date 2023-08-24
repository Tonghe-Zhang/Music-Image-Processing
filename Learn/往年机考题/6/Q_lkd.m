clear all;
close all;
clc;
load('stockdata');
rate_fee=0.002;
%% Q1
figure;
subplot(2,2,1);
plot(opening);
title('opening');
subplot(2,2,2);
plot(closing);
title('closing');
subplot(2,2,3);
plot(peak);
title('peak');
subplot(2,2,4);
plot(nadir);
title('nadir');
%% Q2
cash=1000000;
stock=1000;
for i=2:length(opening)
    if((peak(i)-closing(i-1))/closing(i-1)>=0.05)
        cash=cash-closing(i-1)*1.05*200*(1+rate_fee);
        stock=stock+200;
        if(cash<0)
            disp('Err. money runs out.\n');
            return;
        end
    elseif((nadir(i)-closing(i-1))/closing(i-1)<=-0.05)
        if(stock>=200)
            cash=cash+closing(i-1)*0.95*200*(1-rate_fee);
            stock=stock-200;
        else
            cash=cash+closing(i-1)*0.95*stock*(1-rate_fee);
            stock=0;
        end
    end
end
fprintf(['Q2(Method1):\ncash:',num2str(cash),'\nstock:',num2str(stock),'\ngain:',num2str(cash+stock*closing(end)-1000000-1000*closing(1)),'\n']);
%% Q3
cash=1000000;
stock=1000;
for i=2:length(opening)
    if((peak(i)-closing(i-1))/closing(i-1)>=0.05)
        if(stock>=200)
            cash=cash+closing(i-1)*0.95*200*(1-rate_fee);
            stock=stock-200;
        else
            cash=cash+closing(i-1)*0.95*stock*(1-rate_fee);
            stock=0;
        end
    elseif((nadir(i)-closing(i-1))/closing(i-1)<=-0.05)
        cash=cash-closing(i-1)*1.05*200*(1+rate_fee);
        stock=stock+200;
        if(cash<0)
            disp('Err. money runs out.\n');
            return;
        end
    end
end
fprintf(['Q3(Method2):\ncash:',num2str(cash),'\nstock:',num2str(stock),'\ngain:',num2str(cash+stock*closing(end)-1000000-1000*closing(1)),'\n']);