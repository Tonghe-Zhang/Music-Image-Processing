%twvl_name: C----0   B----11%
%eight_name: C,
function [twvl_name,octave]=freq2note(pitch)

key=round(log(pitch/440)/log(2^(1/12)))+9;
twvl_name=mod(key,12);
octave=4+(key-twvl_name)/12;

end