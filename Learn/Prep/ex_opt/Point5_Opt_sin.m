function Opt_sin

Num = 3E6;
M = 1E3;
N = Num/M;
x1 = sub1(M,N);

x2 = sub2(M,N);

x3 = sub3(M,N);

% M = 1E3;
% N = 1E3;
% P = Num/M/N;
% x4 = sub4(M,N,P);
% 
% x5 = sub5(M,N,P);

function x = sub1(M,N)

for m = 1:M
    for n = 1:N
        x(m,n) = sin(m) + cos(n);
    end
end

function x = sub2(M,N)

x = zeros(M,N);
for m = 1:M
    for n = 1:N
        x(m,n) = sin(m) + cos(n);
    end
end

function x = sub3(M,N)

x = sin([1:M]')*ones(1,N) + ones(M,1)*cos([1:N]);

function x = sub4(M,N,P)

x = zeros(M,N,P);
for p = 1:P
    for m = 1:M
        for n = 1:N
            x(m,n,p) = sin(m) + cos(n) + p;
        end
    end
end

function x = sub5(M,N,P)

x = zeros(M,N,P);
for p = 1:P
    x(:,:,p) = sin([1:M]')*ones(1,N) + ones(M,1)*cos([1:N]);
    x(:,:,p) = x(:,:,p) + p;
end

