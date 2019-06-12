clc;
clear;
filename='data.xlsx';
%读入数据，第一列为凯众股份收盘价，第二列为歌华有线收盘价
data = xlsread(filename);
%假设各购买1000支股票，构成资产组合
asset=1000*data(:,1)+1000*data(:,2);
%将指数转变为收益率
rate=price2ret(asset);
ex=mean(rate);%均值
dov=std(rate);%标准差
%参数法获得VaR
VaR=portvrisk(ex,dov)*asset(end)
