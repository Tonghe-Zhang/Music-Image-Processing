function YouKnowFourier()
close all;
global t w F IF

[t,w,F,IF] = prefourier([-2,2],500,[-2,2]*4*pi,500);

x3 = zeros(length(t),3);
H3 = zeros(length(t),3);
y3 = zeros(length(t),3);
for n = 1:3
    x3(:,n) = genx();
    H3(:,n) = genH();
    y3(:,n) = IF*((F*x3(:,n)).*H3(:,n));
end
offset = floor(rand(1)*3);
for n = 1:3
    subplot(3,3,3*n-2), hold on, axis off;
    plot(t,x3(:,mod(offset+n,3)+1));
    subplot(3,3,3*n-1), hold on, axis off;
    plot(t,H3(:,mod(offset+n,3)+1));
    subplot(3,3,3*n), hold on, axis off;
    plot(t,y3(:,mod(offset+n,3)+1));
end



function x = genx()
global t w F IF
tau = 0.3+round(rand(1)*4)/4;
if rand(1)>0.5
    x = abs(t)<tau;
else
    x = (abs(t)<tau).*(1-abs(t)/tau);
end

function H = genH()
global t w F IF
B = (0.5+round(rand(1)*2)/2)*2*pi;
H = abs(w)<B;


