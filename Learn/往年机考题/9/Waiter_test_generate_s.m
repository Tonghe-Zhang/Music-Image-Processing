function [s] = test_generate_s( frequency )

%第二问要求的函数
t=[0:0.05:1];
s=(t>=0)+cos(2*pi*t*frequency);

end

