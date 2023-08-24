%plot_real_proc_average.m
function plot_real_proc_average(realwave,wave2proc,out)
subplot(2,2,1);
plot(realwave);
set(gca,'YLim',[-0.2,0.25],'XLim',[0,250]);
title("real wave");

subplot(2,2,2);
plot(abs(out-wave2proc));
title("compare averaging and process");
set(gca,'YLim',[-0.2,0.25],'XLim',[0,250]);

subplot(2,2,3);
plot(wave2proc);
title("processed wave");
set(gca,'YLim',[-0.2,0.25],'XLim',[0,250]);

subplot(2,2,4);
plot(out);
title("averaging result");
set(gca,'YLim',[-0.2,0.25],'XLim',[0,250]);

end
