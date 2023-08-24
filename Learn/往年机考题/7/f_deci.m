function s = f_deci(x,L)
y = length(x);
s = zeros(1,floor((y-1)/L)+1);
j=1;
for i=1:L:y
    
    s(j)=x(i);
    j = j+1;
end
end

