function [tplot npf] = fusionPlot(npf,fpixels,z)

npf = (npf/fpixels)*100;

t = [1:25];

figure(51)
axis([0, 25, min(npf)-50, max(npf)+50]);
tplot = plot(npf, '-bo','MarkerSize',5);
ylabel('Percentage of Necks to Foreground Pixels');
xlabel('Time (min)');

b = polyfit(t,[npf],1);
trendline = b(1).*t+b(2);
figure(51)
hold on
tplot = plot(trendline,'-r');


end


