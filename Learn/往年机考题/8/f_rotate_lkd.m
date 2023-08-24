function z=f_rotate_lkd(z,theta)
%f_rotate_lkd is written by Queta Liou (lkd)
%input complex z and angle theta
%angle is supposed to be in [0,180)
%output complex z, which has been rotated
%if z is on x label, no rotate
%but up, clockwise; down, anticlockwise 
    z=z.*exp(-1i*pi*theta*sign(imag(z))/180);
end

