
function interval_len=get_interval(arg)
arg_1=arg(1:end-1);
arg_2=arg(2:end);
intervals=sort(arg_2-arg_1);
plot(intervals);
m1=mean(intervals(2:15));
m2=mean(intervals(16:22));
m3=mean(intervals(23:end));
interval_len=round(mean([m1,m2/2,m3/3]));
end

