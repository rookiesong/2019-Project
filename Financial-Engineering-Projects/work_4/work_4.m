clc;
clear;
filename='data.xlsx';
%�������ݣ���һ��Ϊ���ڹɷ����̼ۣ��ڶ���Ϊ�軪�������̼�
data = xlsread(filename);
%���������1000֧��Ʊ�������ʲ����
asset=1000*data(:,1)+1000*data(:,2);
%��ָ��ת��Ϊ������
rate=price2ret(asset);
ex=mean(rate);%��ֵ
dov=std(rate);%��׼��
%���������VaR
VaR=portvrisk(ex,dov)*asset(end)
