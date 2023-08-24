function z=f_rotate(z,theta)
for m=1:length(z)
    if(imag(z(m))>0)
        z(m)=z(m)*exp(-i*theta/180*pi);
    elseif(imag(z(m))<0)
        z(m)=z(m)*exp(i*theta/180*pi);
    end
end