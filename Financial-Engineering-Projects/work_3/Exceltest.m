clc;
clear;
filename='603037.xlsx';
%读入数据
data = xlsread(filename);
close=data(:,4);
%计算收盘价，(今日收盘价-昨日收盘价)/昨日收盘价。
ratio=diff(close)./close(2:end);
%写入数据
xlswrite(filename,ratio,'H3:H20');
