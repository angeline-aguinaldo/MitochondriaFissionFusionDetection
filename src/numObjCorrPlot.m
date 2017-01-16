clear
close all
clc

load('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\m-files\Collected Variables\variables.mat');

t = [1:25];
H_numObjData = numObjData(1:14,:);
M_numObjData = numObjData(15:26,:);
L_numObjData = numObjData(27:38,:);

H_avgnumObj = mean(H_numObjData, 1);
M_avgnumObj = mean(M_numObjData, 1);
L_avgnumObj = mean(L_numObjData, 1);

figure(52)
plot(H_avgnumObj,'-ro','MarkerSize',5)
hold on
plot(M_avgnumObj,'-go','MarkerSize',5)
hold on
plot(L_avgnumObj,'-bo','MarkerSize',5)
legend('High Oleic Acid','Normal Oleic Acid','Low Oleic Acid');

q = polyfit(t,[H_avgnumObj],1);
[a b c d stat] = regress([H_avgnumObj]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgnumObjPlot = plot(trendline,'-r');
fprintf('y = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2 = %.3f \n',stat(1));

q = polyfit(t,[M_avgnumObj],1);
[a b c d stat] = regress([M_avgnumObj]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgnumObjPlot = plot(trendline,'-g');
fprintf('y = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2 = %.3f \n',stat(1));

q = polyfit(t,[L_avgnumObj],1);
[a b c d stat] = regress([L_avgnumObj]',[ones(25,1) t']);
trendline = q(1).*t+q(2);
figure(52)
hold on
avgnumObjPlot = plot(trendline,'-b');
fprintf('y = %.4fx + %.2f \n',q(1),q(2));
fprintf('R2 = %.3f \n',stat(1));

plotname = sprintf('Number of Objects \n for Different Levels of Oleic Acid');
title(plotname);
xlabel('Time(min)');
ylabel('Average Number of Objects');