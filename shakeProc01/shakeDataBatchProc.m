%%  shakeDataBatchProc.m
%   Thad Haines         
%   Program Purpose:    Batch process shake table data, exporting clean
%                       data and optionally making plots

%   History:
%   03/28/19    13:15   init
%   03/29/19    10:09   verified 'b' version of functions (for old MATLAB)

%% init MATLAB
clear; format compact; clc; close all;

%% Test of single file
fileName = 'MatLAB_01_20190226_10-24-18.csv';

% clean data and export xls
cleanName = shakeDataCleanSmooth( fileName );
shakeDataPlotSub(cleanName)

% Plot raw data
rawName = 'MatLAB_01_20190226_10-24-18.csv';
shakeDataPlotSubRaw(rawName)
