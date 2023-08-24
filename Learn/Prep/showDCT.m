close all
figure;
for n = 1:16
    C = zeros(4);
    C(n) = 1;
    D = idct2(C);
    subplot(4,4,n);
    surf(D);
    set(gca,'XLim',[1,4],'YLim',[1,4]);
    view(0,90);
    colormap('gray');
end