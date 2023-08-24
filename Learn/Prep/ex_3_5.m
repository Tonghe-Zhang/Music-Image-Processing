close all
clear
clc


C = 1; L = 1/4; R1 = 1; R2 = 3/2;
%characteristic matrices
a = [-1/R1/C,-1/C;1/L,-R2/L];
b = [1/R1/C;0];
c = [-1/R1,0];
d = 1/R1;
%define the state space(ss) i.e. the model.
sys = ss(a,b,c,d);

%simulation time steps
tn = [-10:0.01:-0.01]';
%
en = 2*(tn<0);

%rn: output@ t=n
%tn1==tn
%xn, matrix, each row is the state @ t=n
%            last row is the terminal state of the system.
[rn, tn1, xn]= lsim(sys,en,tn);


%we use the terminal state of the response to the first stimunlation 
%last row of xn
% as the initial state of the second stimnulation (4V)  (x0)
x0 = xn(length(tn),:);
t = [0:0.01:10]';

%excitement(stimuation)  4u(t)
e = 4*(t>=0);
%all zero input, for zero-state
ezi = 0*(t>=0);

%response zero state
rzs = lsim(sys,e,t);% with no initial state(x0=0 by default) byt a valid
% input excitement e

%response zero input
rzi = lsim(sys,ezi,t,x0);%with no excitation (ezi==0) but valid initial
%state


rf = lsim(sys,e,t,x0);
r1 = lsim(sys,[en;e],[tn;t]);

ex_3_5_plot();
