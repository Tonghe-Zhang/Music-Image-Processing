function [n_overtone,amps]=inst(name)

if name=="std"
    amps=[1];
    n_overtone=1;
end

if name=="organ"
    amps=[1,0.2,0.3];
    n_overtone=size(amps,2);
end