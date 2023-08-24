%DC_removal_freq.m

function D=DCT_kernel(N)
a=linspace(0,N-1,N);
b=linspace(1,2*N-1,N);
raw=a'.*b;
D=sqrt(2/N).*cos(pi/(2*N).*raw);
D(1,:)=linspace(1/sqrt(N),1/sqrt(N),N);
end




