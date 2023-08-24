function z=f_rotate1(z,theta)
for k = 1:length(z)
    if imag(z(k))>0
    t = angle(z(k));
    t = t - theta*pi/180;
    z(k) = abs(z(k)) * exp(1j*t);
     elseif imag(z(k))<0
        t = angle(z(k));
        t = t + theta*pi/180;
        z(k) = abs(z(k)) * exp(1j*t); 
     end
    end
end
    