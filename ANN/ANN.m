clc;
clear;
filename='data.xlsx';
%读入数据，2005-2017宏观月度数据
data = xlsread(filename);
%先行指数
Xx=data(:,1);
%一致指数
Yz=data(:,2);
%滞后指数
Zh=data(:,3);
%预警指数
Yj=data(:,4);
%上证指数
Sz=data(:,13);
%PMI
PMI=data(:,5);
%进口额累计同期增长
Jk=data(:,6);
%出口额累计同期增长
Ck=data(:,7);
%银行间同业拆借加权平均利率
Cj=data(:,8);
%M2同比增长
M2=data(:,9);
%固定资产投资完成额增长
Gd=data(:,10);
%工业品出厂价格指数
Gy=data(:,11);
%国家财政收入增长
Cz=data(:,12);
R=corrcoef(data);
%宏观变量之间的相关系数矩阵R1
R1=R(1:end-1,1:end-1);
%各宏观变量与上证指数之间的相关系数列向量R2
R2=R(1:end-1,end);
%---------------------------------------
%数据归一化，x~=(x-xmin)/(xmax-xmin)
%带入神经网络的矩阵数据归一化
for i=1:1:13
    data1(:,i)=(data(:,i)-min(data(:,i)))/(max(data(:,i))-min(data(:,i)));
end
%训练数据
Xlimport=data1(:,1:12);
%测试数据
Csimport=data1(:,13);



