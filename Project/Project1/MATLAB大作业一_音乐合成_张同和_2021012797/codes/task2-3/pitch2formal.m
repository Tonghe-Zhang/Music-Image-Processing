%convert a frequency to the nearest music note.
function formal=pitch2formal(pitch)
key=round(log(pitch/440)/log(2^(1/12)))+9;
twvl=mod(key,12);
octave=4+(key-twvl)/12;
[seven,sf]=arrayfun(@twvl2seven,twvl);
formal=arrayfun(@simplified2formal,seven,sf,octave);
end