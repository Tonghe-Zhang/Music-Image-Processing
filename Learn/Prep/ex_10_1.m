%plot sin, sqrt, exp and a customized function x^2-4*x+1 in the same plot.

%the horizon.
t = [0:0.1:2*pi]';
%create an array of function handle, which only contains two function
%handles. 

%@sin: create a functinon handle with standard definition.(and a name)
fh = {@sin};

%now we add new function handles one by one.

%@customized_function_name: create a pointer to a user-defined function
%that is defined in another file. remember to add '@'
fh{2}=@compute_sqrt;

%str2func(.):  create a special function that is recorded by MATLAB and has
%a unique name.
fh{3} = str2func('exp');

%customize a function without a name.
%format:     @(para list) function_mapping_structure
fh{4} = @(t)t.^2-4*t+1;

figure;
for n = 1:4
    subplot(2,2,n);
    plot(t,fh{n}(t));
    xlabel('t');
    %convert the function handles back to strings(function names)
    title([func2str(fh{n}),'(t)']);
    %control the horizontal width of our graph. gca: graphical current axes
    set(gca,'XLim',[0,2*pi]);
end