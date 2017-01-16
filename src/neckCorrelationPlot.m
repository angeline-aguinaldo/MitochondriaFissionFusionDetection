clear
close all
clc

load('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\m-files\Collected Variables\variables.mat');

t = [1:25];

fusionData = fusionData;
H_fusionData = fusionData(1:14,:);
M_fusionData = fusionData(15:26,:);
L_fusionData = fusionData(27:38,:);

H_avgFusion = mean(H_fusionData, 1);
M_avgFusion = mean(M_fusionData, 1);
L_avgFusion = mean(L_fusionData, 1);

figure(52)
plot(H_avgFusion,'-ro','MarkerSize',5)
hold on
plot(M_avgFusion,'-go','MarkerSize',5)
hold on
plot(L_avgFusion,'-bo','MarkerSize',5)
legend('High Oleic Acid','Normal Oleic Acid','Low Oleic Acid');

q = polyfit(t,[H_avgFusion],1);
[a b c d stat] = regress([H_avgFusion]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgFusionPlot = plot(trendline,'-r');
fprintf('y_H = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2_H = %.4f \n',stat(1));

q = polyfit(t,[M_avgFusion],1);
[a b c d stat] = regress([M_avgFusion]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgFusionPlot = plot(trendline,'-g');
fprintf('y_M = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2_M = %.3f \n',stat(1));

q = polyfit(t,[L_avgFusion],1);
[a b c d stat] = regress([L_avgFusion]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgFusionPlot = plot(trendline,'-b');
fprintf('y_L = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2_L = %.3f \n',stat(1));

plotname = sprintf('Number of Necks \n for Different Levels of Oleic Acid');
title(plotname);
xlabel('Time(min)');
ylabel('Average Number of Necks');