

function nm=simplified2formal(eight,sf,octave)

name='0';
Oc=string(octave);

switch eight
    case 1
        name='C';
    case 2
        name='D';
    case 3
        name='E';
    case 4
        name='F';
    case 5
        name='G';
    case 6
        name='A';
    case 7
        name='B';
    otherwise
        name='?';
end

if sf==1
    SF='#';
elseif sf==-1
    SF='b';
else
    SF='';
end

nm=strcat(SF,name,Oc);

end