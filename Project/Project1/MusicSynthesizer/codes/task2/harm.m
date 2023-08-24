
function [H,valid]=harm(w,P)

[A,locs]=findpeaks(P(1:round(length(P)/2)));
f=w(locs)/(2*pi);
[~,argm]=max(A);
fm=f(argm);

H=rand(2,7);
H(1,1)=fm;
H(2,1)=0;

spectrum=[fm/4,fm/2,fm,fm*2,fm*4,fm*8];
if fm/4 <20
    spectrum=[spectrum(2:end),fm*16];
end

I=nrest(spectrum,f);

if ismember(-1,I)==0
%     valid=1;
    H(:,[2:7])=[f(I);A(I)'];
    H(2,2:end)=H(2,2:end)/(sum(H(2,2:end)));
    
end