clear all;
close all;
clc;
a=[1,-1.1,0.6];
b=[0.6,-1.1,1];
zplane(b,a);
figure;
impz(b,a);
%% question 2 
s_1 = generate(3);
s_2 = generate(77);
r_1 = filter(b,a,s_1);
r_2 = filter(b,a,s_2);
subplot(2,2,1);
stem(s_1);
title('s_1');
subplot(2,2,2);
stem(s_2);
title('s_2');
subplot(2,2,3);
stem(r_1);
title('r_1');
subplot(2,2,4);
stem(r_2);
title('r_2');

