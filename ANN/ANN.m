clc;
clear;
filename='data.xlsx';
%�������ݣ�2005-2017����¶�����
data = xlsread(filename);
%����ָ��
Xx=data(:,1);
%һ��ָ��
Yz=data(:,2);
%�ͺ�ָ��
Zh=data(:,3);
%Ԥ��ָ��
Yj=data(:,4);
%��ָ֤��
Sz=data(:,13);
%PMI
PMI=data(:,5);
%���ڶ��ۼ�ͬ������
Jk=data(:,6);
%���ڶ��ۼ�ͬ������
Ck=data(:,7);
%���м�ͬҵ����Ȩƽ������
Cj=data(:,8);
%M2ͬ������
M2=data(:,9);
%�̶��ʲ�Ͷ����ɶ�����
Gd=data(:,10);
%��ҵƷ�����۸�ָ��
Gy=data(:,11);
%���Ҳ�����������
Cz=data(:,12);
R=corrcoef(data);
%��۱���֮������ϵ������R1
R1=R(1:end-1,1:end-1);
%����۱�������ָ֤��֮������ϵ��������R2
R2=R(1:end-1,end);
%---------------------------------------
%���ݹ�һ����x~=(x-xmin)/(xmax-xmin)
%����������ľ������ݹ�һ��
for i=1:1:13
    data1(:,i)=(data(:,i)-min(data(:,i)))/(max(data(:,i))-min(data(:,i)));
end
%ѵ������
Xlimport=data1(:,1:12);
%��������
Csimport=data1(:,13);



