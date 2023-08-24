function C=DCT(P)
P=double(P);

sz=size(P);
X=sz(1);
Y=sz(2);
L=min(X,Y);

D=DCT_kernel(L);
C=D*P*D';
end