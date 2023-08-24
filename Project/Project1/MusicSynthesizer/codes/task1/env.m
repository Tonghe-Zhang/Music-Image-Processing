
%the envelope of each note.
%t is a row matrix. alpha is the dampen factor
% return a exponential decaying envelope added to the second half of t.
%recommended value: alpha=4.0,  ratio=0.5
function y=env(t,alpha,ratio)

d1=round(length(t)*0.1);
d2=round(length(t)*(ratio));

t1=t(1:d1);
y1=t1/max(t1);

t2=t(d1+1:d1+d2);
y2=linspace(1,1,length(t2));

t3=t(d1+d2+1:end);
y3=exp(-0.0001*alpha.*(t3-max(t2)));

y=[y1,y2,y3];

figure
plot(y);
tit=sprintf("envelope \n alpha= %1.1f ratio=%1.1f",alpha,ratio);
title(tit);
ylabel("Intensity");
xlabel("time");
end