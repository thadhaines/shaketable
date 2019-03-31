function [  ] = shakeDataPlotSub2( cleanName, optionalXlimtit )
%shakeDataPlotSub Creates Figure with subplots from clean data file
% plots only un-processed data, provides optional X plot limits    

bfz= 10; % font Size
lw = 1.3;
grey = [.7 .7 .7];
cleanData = xlsread(cleanName);


fprintf('Plotting data from: %s\n', cleanName)
t = cleanData(:,2);
Vout = cleanData(:,3);
g1 = cleanData(:,4);
g2 = cleanData(:,6);

if nargin > 1
    xlimit = optionalXlimtit;
else
    xlimit = [t(1) t(end)];
end

figure
subplot(3,1,1)
plot(t,Vout,'k','linewidth',lw)
title('Voltage Input')
%xlabel('Time [sec]')
ylabel('Voltage [V]')
grid on
set(gca, 'fontsize',bfz)
xlim(xlimit)

subplot(3,1,2)
plot(t,g1,'k','linewidth',lw)
hold on
title('Accelerometer g1 - Table')
%xlabel('Time [sec]')
ylabel('g [g]')
grid on
set(gca, 'fontsize',bfz)
xlim(xlimit)

subplot(3,1,3)
plot(t,g2,'k','linewidth',lw)
title('Accelerometer g2 -Block')
xlabel('Time [sec]')
ylabel('g [g]')
grid on
set(gca, 'fontsize',bfz)
xlim(xlimit)
end

