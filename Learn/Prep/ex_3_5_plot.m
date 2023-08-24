





figure;
subplot(1,2,1), hold on, box on;
set(gca,'FontSize',16);
set(gca,'YLim',[-1.5,4.5]);
plot([tn;t],[en;e],'k');
plot([tn;t],[rn;rf],'k--');
plot(t,rzs,'k:');
plot(t,rzi,'k-.');
legend('input','r_f','r_{zs}','r_{zi}');
xlabel('time');
title('Method 1');

subplot(1,2,2), hold on, box on;
set(gca,'FontSize',16);
set(gca,'YLim',[-1.5,4.5]);
plot([tn;t],[en;e],'k-');
plot([tn;t],r1,'k--');
legend('input','r_f');
xlabel('time');
title('Method 2');