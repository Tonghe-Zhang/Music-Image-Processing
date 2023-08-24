function whether=multiple(y,x,eps)
whether=0;
if( abs((y/x)-round(y/x))<eps ==1)
    whether=1;
end