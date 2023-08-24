close all;
clc;

%equation:
%y(n) - 0.9 y(n-1) + 0.3 y(n-2)= 0.05 x(n)
a = [1, -0.9, 0.3];
b = 0.05;

%excitation x(n) = u(n) (only calculate the first 20 steps)
n = [0:20]';
u = (n>=0);

%zero input
uz = zeros(size(u));
%wave initial conditions
wi1 = [-a(3); 0];
wi2 = [-a(2); -a(3)];

ic_1=filtic(b,a,[0,1],0);
ic_2=filtic(b,a,[1,0],0);

%this command generates two plots. yzs(:,1)  yzs(:,2)
%by default, the omitted last argument of filter(which is ic)is set to one,
%giving a zero-state output.
%since the input is packed together like [u,u], we are solving two
%equations.
[yzs,wf_zs] = filter(b, a, [u,u]);


%this command generates two plots. yzi(:,1)  yzi(:,2)
[yzi,wf_zi] = filter(b, a, [uz,uz], [wi1,wi2]); %initial condition of x=0

%this command generates two plots. y(:,1)  y(:,2)
[y,wf] = filter(b, a, [u,u],[wi1,wi2]);

ex_7_2_plot();
