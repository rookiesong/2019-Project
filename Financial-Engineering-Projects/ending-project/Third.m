clc;
%����GARCHģ�ͷ���
%GARCH(1,1)ģ�͹��������
Mdl = garch('GARCHLags',1,'ARCHLags',1,'Offset',NaN);
EstMdl=estimate(Mdl,Ret);

%GARCH����
num=numel(Ret);%������
numPaths=1;%Ҫ����Ĵ���
[VSim,YSim]=simulate(EstMdl,num,'NumPaths',numPaths);
SimClose(1)=Close(1);
for i=1:199
    SimClose(i+1)=SimClose(i)*exp(YSim(i));
end
%ԭʼ�۸����������۸����жԱȼ�����
figure(3);
plot(Close,'r:');
hold on
plot(SimClose,'b-');
hold off
legend('Close','SimClose');
title('ԭʼ�۸����������۸����жԱ�ͼ');
ylabel('���̼۸�');

%GARCHԤ�⣬Ԥ����չʾ�ͷ�����
numPeriods=50;%Ԥ������
vF1=forecast(EstMdl,numPeriods);%��ʹ�÷�����Ԥ��
vF2=forecast(EstMdl,numPeriods,'Y0',YSim);%ʹ�÷�����Ԥ��
figure(4);
plot(VSim);
hold on
plot([numel(Ret)+1:numel(Ret)+50],vF1,'r:');
plot([numel(Ret)+1:numel(Ret)+50],vF2,'m-');
legend('�۲�ֵ','��ʹ�÷�����Ԥ��','ʹ�÷�����Ԥ��');
title('Ԥ����������');
hold off




