clc;
clear;
%һ��	���ݴ���
%ascii2fts�������ݣ�Ҫ�����ݴ���100��
fts=ascii2fts('600037.txt',1,1);
%��ʾǰ����ʱ����������
data5=getfield(fts,{'Open','High','Low','Close'},{'2018/8/2','2018/8/3','2018/8/6','2018/8/7','2018/8/8'})
%����fts2matת���ɾ��󣬲���ȡ�������У�չʾ�۸�����
Mat=fts2mat(fts,1);
Close=Mat(:,5);
figure(1);
plot(Close,'r:');
ylabel('���̼۸�');
xlabel('ʱ��');
%����price2retת�������������У�չʾ����������������
Ret=price2ret(Close);
figure(2);
bar(Ret);
ylabel('������');
xlabel('ʱ��')
%��λ�����飬����������
h=adftest(Ret)
%h=1�������ܾ�ԭ���裬����ƽ��












