clc;
%三、GARCH模型分析
%GARCH(1,1)模型估计与分析
Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset',NaN);
EstMdl=estimate(Mdl,Ret);

%GARCH仿真
num=numel(Ret);%样本量
numPaths=1;%要仿真的次数
[VSim,YSim]=simulate(EstMdl,num,'NumPaths',numPaths);
SimClose(1)=Close(1);
for i=1:199
    SimClose(i+1)=SimClose(i)*exp(YSim(i));
end
%原始价格序列与仿真价格序列对比及分析
figure(3);
plot(Close,'r:');
hold on
plot(SimClose,'b-');
hold off
legend('Close','SimClose');
title('原始价格序列与仿真价格序列对比图');
ylabel('收盘价格');
%另一种价格对比显示
figure(4);
subplot(2,1,1),plot(Close,'r:');title('原始价格序列Close')
subplot(2,1,2),plot(SimClose,'b-');title('仿真价格序列SimClose')

%GARCH预测，预测结果展示和分析。
numPeriods=50;%预测期数
vF1=forecast(EstMdl,numPeriods);%不使用仿真结果预测
vF2=forecast(EstMdl,numPeriods,'Y0',YSim);%使用仿真结果预测
figure(5);
plot(VSim);
hold on
plot([numel(Ret)+1:numel(Ret)+50],vF1,'r:');
plot([numel(Ret)+1:numel(Ret)+50],vF2,'m-');
legend('观测值','不使用仿真结果预测','使用仿真结果预测');
title('预测条件方差');
hold off




