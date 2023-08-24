function Opt_Fourier

[t,f,fs,omg,F] = CompbyLoop;
[t,f,fs,omg,F] = CompbyVector;
[t,f,fs,omg,F] = CompbyMatrix;

myplot(t,f,fs,omg,F);


function [t,f,fs,omg,F] = CompbyLoop
T = 2;
N = 2000;
t = linspace(-T/2,T/2-T/N,N)';
f = (t>-1/2&t<1/2);
OMG = 16*pi;
K = 2000;
omg = linspace(-OMG/2,OMG/2-OMG/K,K)';
F = zeros(size(omg));
for k = 1:K
    for n = 1:N
        F(k) = F(k) + T/N*f(n)*exp(-j*omg(k)*t(n));
    end
end
fs = zeros(size(t));
for n = 1:N
    for k = 1:K
        fs(n) = fs(n) + OMG/2/pi/K*F(k)*exp(j*omg(k)*t(n));
    end
end


function [t,f,fs,omg,F] = CompbyVector

T = 2;
N = 2000;
t = linspace(-T/2,T/2-T/N,N)';
f = (t>-1/2&t<1/2);
OMG = 16*pi;
K = 2000;
omg = linspace(-OMG/2,OMG/2-OMG/K,K)';
F = zeros(size(omg));
for k = 1:K
    F(k) = T/N*exp(-j*omg(k)*t).'*f;
end
fs = zeros(size(t));
for n = 1:N
    fs(n) = OMG/2/pi/K*exp(j*omg*t(n)).'*F;
end


function [t,f,fs,omg,F] = CompbyMatrix

T = 2;
N = 2000;
t = linspace(-T/2,T/2-T/N,N)';
f = (t>-1/2&t<1/2);
OMG = 16*pi;
K = 1000;
omg = linspace(-OMG/2,OMG/2-OMG/K,K)';
U = exp(-j*kron(omg,t.'));
F = T/N*U*f;
V = exp(j*kron(t,omg.'));
fs = OMG/2/pi/K*V*F;


function [t,f,fs,omg,F] = myplot(t,f,fs,omg,F)

figure;
subplot(1,2,1), hold on, box on;
plot(t,f,'k-');
plot(t,real(fs),'k-.');
set(gca,'YLim',[-.5 1.5],'FontSize',16);
xlabel('t');
ylabel('f(t)');
legend('f(t)','f_s(t)');
subplot(1,2,2), hold on, box on;
plot(omg,real(F),'k-');
set(gca,'XLim',[-8*pi,8*pi],'YLim',[-0.5 1.5],'FontSize',16);
xlabel('\omega');
ylabel('F(\omega)');
