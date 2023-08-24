

%inst.m
%generat the sound characteristics of a given instrument
function [n_overtones,amps]=inst(name)

if name=="std"
    amps=[1];
    n_overtones=[1];
end

if name=="organ"
    amps=[1,0.2,0.3];
    n_overtones=size(amps,2);
end

if name=="guitar"
    A=readmatrix("spectrum_of_guitar.txt");
    %freq=A(:,1)';
    amps=A(:,2)';
    n_overtones=length(amps);
end