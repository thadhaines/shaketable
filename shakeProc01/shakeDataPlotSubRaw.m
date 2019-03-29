function [  ] = shakeDataPlotSubRaw( rawName )
%shakeDataPlotSub Creates Figure with subplots from raw data file
fz= 13; % font Size
grey = [.7 .7 .7];

rawData = xlsread(rawName);

fprintf('Plotting data from: %s\n', rawName)
t = rawData(:,1);
Vout = rawData(:,2);
LED = rawData(:,3);
g1 = rawData(:,4);
g1S = smooth(rawData(:,4),'moving',50);
%g1S = smoothdata(rawData(:,4),'movmean',50); % For new MATLAB
g2 = rawData(:,5);
g2S = smooth(rawData(:,5),'moving',50);
%g2S = smoothdata(rawData(:,5),'movmean',50); % For new MATLAB

figure
subplot(3,1,1)
plot(t,Vout,'k','linewidth',2)
hold on
plot(t,LED,'m','linewidth',2)
title('Voltages')
xlabel('Time [sec]')
ylabel('Voltage [V]')
legend('Output Voltage','LED')
grid on
set(gca, 'fontsize',fz)

subplot(3,1,2)
plot(t,g1,'color',grey,'linewidth',2)
hold on
plot(t,g1S,'k','linewidth',1)
legend('g1','g1 Smoothed')
title('Accelerometer g1 - Table')
xlabel('Time [sec]')
ylabel('g [g]')
set(gca, 'fontsize',fz)
grid on

subplot(3,1,3)
plot(t,g2,'color',grey,'linewidth',2)
hold on
plot(t,g2S,'k','linewidth',1)
legend('g2','g2 Smoothed')
title('Accelerometer g2 - Block')
xlabel('Time [sec]')
ylabel('g [g]')
set(gca, 'fontsize',fz)
grid on
end

