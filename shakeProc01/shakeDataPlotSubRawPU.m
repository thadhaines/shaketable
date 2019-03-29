function [  ] = shakeDataPlotSubRaw( rawName )
%shakeDataPlotSub Creates Figure with subplots from raw data file
fz= 13; % font Size
grey = [.7 .7 .7];

rawData = xlsread(rawName);

fprintf('Plotting data from: %s\n', rawName)
t = rawData(:,1);
Vout = rawData(:,2)./max(rawData(:,2));
LED = rawData(:,3)./max(rawData(:,3));
g1 = rawData(:,4)./abs(max(rawData(:,4)));
g1S = smooth(g1,'moving',50);
%g1S = smoothdata(rawData(:,4),'movmean',50); % For new MATLAB
g2 = rawData(:,5)./abs(max(rawData(:,5)));
g2S = smooth(g2,'moving',50);
%g2S = smoothdata(rawData(:,5),'movmean',50); % For new MATLAB

figure
plot(t,Vout,'k','linewidth',2)
hold on
plot(t,LED,'color',[0 1 0],'linewidth',2)

plot(t,g1,'color','g','linewidth',2)
plot(t,g1S,'k','linewidth',1,'color','m')

plot(t,g2,'color','r','linewidth',2)
plot(t,g2S,'k','linewidth',1,'color','m')


title('Voltages')
xlabel('Time [sec]')
ylabel('Signal [PU]')
legend('Vout','LED','g1 - Table','g1 Smoothed','g2- Block','g2 Smoothed')
set(gca, 'fontsize',fz)
legend('Output Voltage','LED')
grid on
end

