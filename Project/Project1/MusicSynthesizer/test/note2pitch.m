% N A 4 --->440 HZ

%also return the absolute place of this note within its octave. (y)
function [pitch,y]=note2pitch(note)

alter=note{1};
name=note{2};
octave=note{3};

A4_pitch=440;


if isa(name,'char')
if name=='C'
    y=0;
elseif name=='D'
    y=2;
elseif name=='E'
    y=4;
elseif name=='F'
    y=5;
elseif name=='G'
    y=7;
elseif name=='A'
    y=9;
elseif name=='B'
    y=11;
else
    disp("Undefined Key:");
    disp(name);
end
end

if alter=='N'
    y=y;
elseif alter=='S'
    y=y+1;
elseif alter=='F'
    y=y-1;
end


shamt=(y-9)+12*(octave-4);

pitch=A4_pitch*(power(1.05946309,shamt));

end 