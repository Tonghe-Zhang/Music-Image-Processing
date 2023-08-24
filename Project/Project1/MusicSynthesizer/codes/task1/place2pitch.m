

function freq=place2pitch(place_in_octave,place_of_octave,base_key)

[base_pitch,base_place]=note2pitch(base_key);  %ok

shamt_name=place_in_octave-base_place;      %

shamt_oct=place_of_octave-base_key{3};

shamt=shamt_name+shamt_oct*12;

freq=base_pitch*power(1.05946309,shamt);

%to write in this ways gives the correct result but it seems not right?
freq=freq.*(base_pitch/261.63);

end
