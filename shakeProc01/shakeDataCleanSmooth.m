function [ cleanName ] = shakeDataCleanSmooth( fileName )
%shakeDataCleanSmooth Reads raw shake table data and exports clean and
%smooth data. Returns name of cleaned file.
% Parse first 5 Columns from Raw Data when LED < 3.5
% Includes removing data from begining and end of raw data, making new time
fprintf('Reading %s...\n',fileName)
% Read in of raw data
rawData = xlsread(fileName);

fprintf('Data Read Okay. Parsing Data...')
% Separation of desired data columns
t = rawData(:,1);
Vout = rawData(:,2);
LED = rawData(:,3);
g1 = rawData(:,4);
g2 = rawData(:,5);

% Data timestep
ts = (t(2)-t(1));

% First Index when LED < 3.5 V
dataStart = find(LED<3.5, 1);
dataEnd = find(LED(dataStart:end)>3.5,1);

% Handle MATLAB indexing from 1
dataEnd = dataStart+dataEnd - 2;

% collect cleanData
cleanData(:,1) = t(dataStart:dataEnd);
% Create new time starting for clean data
cleanData(:,2) = (0:length(cleanData(:,1))-1)*ts;
cleanData(:,3) = Vout(dataStart:dataEnd);

fprintf(' Smoothing Data...')
% Handle raw and smoothed accel data
cleanData(:,4) = g1(dataStart:dataEnd);
cleanData(:,5) = smoothdata(cleanData(:,4),'movmean',50);
cleanData(:,6) = g2(dataStart:dataEnd);
cleanData(:,7) = smoothdata(cleanData(:,6),'movmean',50);

% Column header definition - May change if desired
col_header={'Old Time [sec]','Time [sec]','Vout [V]',...
    'g1 raw [g]','g1 smooth [g]','g2 raw [g]','g2 smooth [g]'};

fprintf(' Writing Clean Data...\n')
cleanName = strjoin({fileName(1:(end-3)), 'clean.xls'});
xlswrite(cleanName,col_header);
xlswrite(cleanName,cleanData,1,'A2')
fprintf('Clean Data Saved as: %s\n', cleanName)
end