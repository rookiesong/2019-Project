clc;
clear;
filename='603037.xlsx';
%��������
data = xlsread(filename);
close=data(:,4);
%�������̼ۣ�(�������̼�-�������̼�)/�������̼ۡ�
ratio=diff(close)./close(2:end);
%д������
xlswrite(filename,ratio,'H3:H20');
