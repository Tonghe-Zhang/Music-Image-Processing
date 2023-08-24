





function whether=is_int(x,eps)
if(abs(x-round(x))<eps)
    whether=1;
else 
    whether=0;
end
end