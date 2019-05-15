clear;
clc;
%文本中的数据为凯众股份（603037）2018/5/10-2019/4/2总计219期日线数据，数据来源为雅虎金融
filename = 'data.csv';
data = readtable(filename);

Dates=data.Date(20:end);
Open=data.Open;
High=data.High;
Low=data.Low;
Close=data.Close;

%计算5日线上每天的平均值，从最后一个收盘价往前数5天，然后用mean求平均值。
%不过为了计算200日中第一期的平均值，需要之前四天的收盘价，因此总共用到204日的收盘价。
fiveave=zeros(1,200);%初始化5日线均值向量。
for i=1:200
fiveave(201-i)=mean(Close(220-i:-1:220-i-4));
end

%同样计算20日线上每天的平均值，总共用到了219日的收盘价
twentyave=zeros(1,200);%初始化20日线均值向量。
for i=1:200
twentyave(201-i)=mean(Close(220-i:-1:220-i-19));
end

plot(fiveave,'b-','LineWidth',1.5);%绘制5日线

hold on
plot(twentyave,'m-','LineWidth',1.5);%绘制20日线
candle(High(20:end), Low(20:end), Close(20:end), Open(20:end),'r');%最终绘制数据采用2018/6/7-2019/4/2总计200期日线数据

axis([0,200,14,28]);
set(gca,'XTickLabel',Dates(1:18:end));
legend('5日线','20日线');