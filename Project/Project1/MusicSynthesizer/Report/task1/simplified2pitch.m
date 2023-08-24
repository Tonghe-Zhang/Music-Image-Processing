
%convert a simplified sheet music to a list of frequencies and durations
%sheet: N x 4 matrix.
function [freq,dur]=simplified2pitch(sheet,base_key)

%columns of sheet:     natural_name|sharp/flat|octave|duration
%flat or sharp, convert to relative place w.rt. the C in this octave.

sheet(:,1)=arrayfun(@f_alter,sheet(:,1),sheet(:,2)); 

freq=place2pitch(sheet(:,1),sheet(:,3),base_key);



dur=sheet(:,end);

end