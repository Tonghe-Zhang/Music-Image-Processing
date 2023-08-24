function s=generate_s_lkd(frequency)
%generate_s_lkd is written by Queta Liou (lkd)
%input frequency
%output sign s
    t=(0:1/20:1).';
    s=heaviside(t)+cos(2*pi*frequency*t);
end

