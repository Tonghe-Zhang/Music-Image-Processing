function Opt_ZAP

N = 20;
P = randn(N);

wxh(P,N);

T = 8;
fastwxh(P,N,T);

function result = wxh(P,N)
t=inf;
for i=0:2^(N-1)-1
    b=dec2bin(i);
    lb=length(b);
    s=-ones(N,1);
    for j=N-lb+1:N
        if b(j-N+lb)=='1'
            s(j)=1;
        end
    end
    Ps=norm(P*s);
    if Ps<t
        t=Ps;
    end
end

function result = fastwxh(P,N,T)

Tnum = 2^T;
st = -ones(T,1);
starray = zeros(T, Tnum);
for i = 1:Tnum
    starray(:,i) = st;
    for n = T:-1:1
        st(n) = st(n) + 1;
        if st(n) == 2
            st(n) = -1;
        else
            st(n) = 1;   
            break;
        end
    end
end

PH = P(:,1:N-T);
PT = P(:,end+1-T:end);
PTsarray = PT*starray;

t=inf;
s = -ones(N-T,1);
for i=0:2^(N-T-1)-1
    PHs = PH*s;
    Psarray = PHs*ones(1,Tnum) + PTsarray;
    Ps = min(sqrt(sum(Psarray.*Psarray,1)));
    if Ps<t
        t=Ps;
    end
    for n = N-T:-1:1
        s(n) = s(n) + 1;
        if s(n) == 2
            s(n) = -1;
        else
            s(n) = 1;   
            break;
        end
    end
end