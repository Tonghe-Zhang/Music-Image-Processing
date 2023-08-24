


function H=harm(w,P)

[A,locs]=findpeaks(P(1:round(length(P)/2)));
f=w(locs)/(2*pi);
[Pm,argm]=max(A);
fm=f(argm);

H=rand(2,6);
H(1,1)=fm;
H(2,1)=Pm;

i=nrest(f,fm/4);
H(:,2)=[f(i);A(i)];

i=nrest(f,fm/2);
H(:,3)=[f(i);A(i)];

i=nrest(f,fm);
H(:,4)=[f(i);A(i)];

i=nrest(f,fm*2);
H(:,5)=[f(i);A(i)];

i=nrest(f,fm*4);
H(:,6)=[f(i);A(i)];

H(2,2:end)=H(2,2:end)/(sum(H(2,2:end)));
end