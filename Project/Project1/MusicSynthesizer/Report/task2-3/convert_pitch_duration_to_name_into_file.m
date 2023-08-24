%convert_pitch_duration_to_name_into_file.m
%input two arrays that contain the pitch and duration of each note
%conver the pitch to notes.
%write the results to file.
%key: is the absolute position on the keyboard, with centrl C being 0.
%twvl is the note written in 12. C--0  B--11;
%seven: C--1  #C----1.5   B--7
%sf:sharp---#  flat----b
%formal_twvl: #C4
function convert_pitch_duration_to_name_into_file(pitch,dur,directory)
key=round(log(pitch/440)/log(2^(1/12)))+9;
twvl=mod(key,12);
octave=4+(key-twvl)/12;
[seven,sf]=arrayfun(@twvl2seven,twvl);
formal_twvl=arrayfun(@simplified2formal,seven,sf,octave);
output=[pitch',key',twvl',seven',sf',octave',dur',formal_twvl'];
writematrix(output,directory,'Delimiter','tab');
end
