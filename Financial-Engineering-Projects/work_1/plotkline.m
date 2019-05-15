clear;
clc;
%�ı��е�����Ϊ���ڹɷݣ�603037��2018/5/10-2019/4/2�ܼ�219���������ݣ�������ԴΪ�Ż�����
filename = 'data.csv';
data = readtable(filename);

Dates=data.Date(20:end);
Open=data.Open;
High=data.High;
Low=data.Low;
Close=data.Close;

%����5������ÿ���ƽ��ֵ�������һ�����̼���ǰ��5�죬Ȼ����mean��ƽ��ֵ��
%����Ϊ�˼���200���е�һ�ڵ�ƽ��ֵ����Ҫ֮ǰ��������̼ۣ�����ܹ��õ�204�յ����̼ۡ�
fiveave=zeros(1,200);%��ʼ��5���߾�ֵ������
for i=1:200
fiveave(201-i)=mean(Close(220-i:-1:220-i-4));
end

%ͬ������20������ÿ���ƽ��ֵ���ܹ��õ���219�յ����̼�
twentyave=zeros(1,200);%��ʼ��20���߾�ֵ������
for i=1:200
twentyave(201-i)=mean(Close(220-i:-1:220-i-19));
end

plot(fiveave,'b-','LineWidth',1.5);%����5����

hold on
plot(twentyave,'m-','LineWidth',1.5);%����20����
candle(High(20:end), Low(20:end), Close(20:end), Open(20:end),'r');%���ջ������ݲ���2018/6/7-2019/4/2�ܼ�200����������

axis([0,200,14,28]);
set(gca,'XTickLabel',Dates(1:18:end));
legend('5����','20����');