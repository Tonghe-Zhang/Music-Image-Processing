%zigzag
function z=zigzag(A)
[H,W]=size(A);
N=H+W;

%each right slanting line: i+j=k
slant=[];
%output
z=[];
%whether should flip this line
will_flip=0;
for k=2:N
    slant=[];
    will_flip=1-mod(k,2);  
    for i=max(1,k-W):min(k-1,H) 
        slant=[slant,A(i,k-i)];
    end
    if will_flip
        slant=flip(slant);
    end
    z=[z,slant];
end
end