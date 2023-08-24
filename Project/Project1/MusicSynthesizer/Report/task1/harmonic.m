%harmonic.m
%inut base pitch, filename, time axis
%output a harmonic wave mimicing the instrument's style.
function tone=harmonic(pb,instrument_file,t)
A=readmatrix(instrument_file);
B=[A(:,1),A(:,10:end)];
B=[B(:,1:7),B(:,10:end)];

known_spec=B(:,1);
%estimate this pitch with its nearest neighbor.
[dis,id]=min(abs(pb-known_spec));

if dis <3  %this is the note, we know its spectrum.
    id=randi(id);%in case there are multiple options...
    freqs=B(id,2:7); 
    %disp("know this note");
elseif dis>=3%this NOT the note, we DO NOT know its spectrum.
%We have to use the nearest note's amplitude distribution to estimate.
%however, the frequencies should be re-defined.This is a very raw estimate.
    freqs=[pb/4,pb/2,pb,pb*2,pb*4,pb*8];  
    %disp("imitate this note");
end
    amps=B(id,8:13).^(0.5);%B gives the power spectrum, convert to amplitude.
    tone=amps*sin(2*pi*freqs'*t);  
    %harmonic wave, without envelope.
    %the sum of the square of amps sum up to one.
end
