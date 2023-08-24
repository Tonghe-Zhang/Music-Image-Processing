 function [b,a]=f_allpass_lkd(p)
 %f_allpass_lkd is written by Queta Liou (lkd)
 %input complex p, which means pole
 %output b,a representing all-passsed transfunction
    [b,a]=zp2tf(1./conj(p),p,1);
 end