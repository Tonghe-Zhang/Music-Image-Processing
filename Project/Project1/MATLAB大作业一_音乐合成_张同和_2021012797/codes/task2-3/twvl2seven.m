

%twvl2seven.m
%b=arrayfun(@twvl2seven,a,'UniformOutput',false);
function [seven,sf]=twvl2seven(twvl)

switch twvl
    case 0
        seven=1;
        sf=0;
    case 1
        seven=1;
        sf=1;
    case 2
        seven=2;
        sf=0;
    case 3
        seven=2;
        sf=1;
    case 4
        seven=3;
        sf=0;
    case 5
        seven=4;
        sf=0;
    case 6
         seven=4;
        sf=1;
    case 7
         seven=5;
        sf=0;
    case 8
        seven=5;
        sf=1;
    case 9
        seven=6;
        sf=0;
    case 10
        seven=6;
        sf=1;
    case 11
        seven=7;
        sf=0; 
    otherwise
        dsp("wrong twvl");
        dsp(twvl);



end

