function [  ] = shakeDataPlot( cleanName )
%shakeDataPlot Creates Plots from clean data file

grey = [.7 .7 .7];

cleanData = xlsread(cleanName);

fprintf('Plotting data from: %s\n', cleanName)
t = cleanData(:,2);
Vout = cleanData(:,3);
g1 = cleanData(:,4);
g1S = cleanData(:,5);
g2 = cleanData(:,6);
g2S = cleanData(:,7);

figure
plot(t,Vout,'k','linewidth',2)
title('Voltage Input')
xlabel('Time [sec]')
ylabel('Voltage [V]')
grid on

figure
plot(t,g1,'color',grey)
hold on
plot(t,g1S,'k','linewidth',1)
legend('g1','g1 Smoothed')
title('Accelerometer g1')
xlabel('Time [sec]')
ylabel('g [g]')
grid on

figure
plot(t,g2,'color',grey)
hold on
plot(t,g2S,'k','linewidth',1)
legend('g2','g2 Smoothed')
title('Accelerometer g2')
xlabel('Time [sec]')
ylabel('g [g]')
grid on
end

