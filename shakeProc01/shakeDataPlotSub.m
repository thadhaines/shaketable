function [  ] = shakeDataPlotSub( cleanName )
%shakeDataPlotSub Creates Figure with subplots from clean data file
fz= 10; % font Size
grey = [.7 .7 .7];

cleanData = xlsread(cleanName);

fprintf('Plotting data from: %s\n', cleanName)
t = cleanData(:,2);
Vout = cleanData(:,3);
g1 = cleanData(:,4);
g1S = cleanData(:,5);
g2 = cleanData(:,6);
g2S = cleanData(:,7);
xlimit = [t(1) t(end)];

figure
subplot(3,1,1)
plot(t,Vout,'k','linewidth',2)
title('Voltage Input')
xlabel('Time [sec]')
ylabel('Voltage [V]')
grid on
set(gca, 'fontsize',fz)
xlim(xlimit)

subplot(3,1,2)
plot(t,g1,'color',grey)
hold on
plot(t,g1S,'k','linewidth',1)
legend('g1','g1 Smoothed')
title('Accelerometer g1 - Table')
xlabel('Time [sec]')
ylabel('g [g]')
grid on
set(gca, 'fontsize',fz)
xlim(xlimit)

subplot(3,1,3)
plot(t,g2,'color',grey)
hold on
plot(t,g2S,'k','linewidth',1)
legend('g2','g2 Smoothed')
title('Accelerometer g2 - Block')
xlabel('Time [sec]')
ylabel('g [g]')
grid on
xlim(xlimit)
set(gca, 'fontsize',fz)
end

