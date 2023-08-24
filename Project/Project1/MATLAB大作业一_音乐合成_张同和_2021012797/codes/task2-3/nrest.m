%nrest.m
function y=nrest(x,X)
%eps=0.02;
d=x;
y=x;
for i=1:length(x)
    [d(i),y(i)]=min(abs(x(i)-X));
%     if d(i)>eps
%         y(i)=-1;
%     end
end
end