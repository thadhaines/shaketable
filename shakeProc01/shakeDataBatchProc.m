%%  shakeDataBatchProc.m
%   Thad Haines         
%   Program Purpose:    Batch process shake table data, exporting clean
%                       data and optionally making plots

%   History:
%   03/28/19    13:15   init

%% init MATLAB
clear; format compact; clc; close all;

%% Test of single file
%fileName = 'MatLAB_01_20190226_10-24-18.csv';

%cleanName = shakeDataCleanSmoothb( fileName );

cleanName = 'MatLAB_01_20190226_10-24-18.csv';
shakeDataPlotSubRaw(cleanName)
