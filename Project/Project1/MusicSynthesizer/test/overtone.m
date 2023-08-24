function note=overtone(p_b,A_b,n_tone,amps,t)
p=p_b;
pitches=[p_b];
for i=2:n_tone
    pitches(i)=p*2;
    p=p*2;
end 
note_waves=A_b*sin(2*pi*pitches'*t);  %matrix: each row is a note at a freq.
note=amps*note_waves;
end
