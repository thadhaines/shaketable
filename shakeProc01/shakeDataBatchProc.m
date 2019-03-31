%%  shakeDataBatchProc.m
%   Thad Haines         
%   Program Purpose:    Batch process shake table data, exporting clean
%                       data and optionally making plots

%   History:
%   03/28/19    13:15   init
%   03/29/19    10:09   verified 'b' version of functions (for old MATLAB)
%   03/31/19    10:41   Addition of sub2 - unfiltered data, optional xlim

%% init MATLAB
clear; format compact; clc; close all;

%% Test of single file
rawName = 'MatLAB test data01_20190329_14-58-13.csv'
% clean data and export xls
cleanName = shakeDataCleanSmooth( rawName );

%% Plot data
% Plot smoothed data with raw data
shakeDataPlotSub(cleanName)

% Plots of unfiltered data
shakeDataPlotSub2(cleanName)
shakeDataPlotSub2(cleanName, [0, 3]) % optional xlimit entry

% Plot raw data
shakeDataPlotSubRaw(rawName)

