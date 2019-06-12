clc;
clear;
%一、	数据处理
%ascii2fts导入数据，要求数据大于100期
fts=ascii2fts('600037.txt',1,1);
%显示前五期时间序列数据
data5=getfield(fts,{'Open','High','Low','Close'},{'2018/8/2','2018/8/3','2018/8/6','2018/8/7','2018/8/8'});
%利用fts2mat转换成矩阵，并提取收盘序列，展示价格序列
Mat=fts2mat(fts,1);
Close=Mat(:,5)
%利用price2ret转换成收益率序列，展示并分析收益率序列
Ret=price2ret(Close)
%单位根检验，分析检验结果
h=adftest(Ret)
%h=1表明该检验拒绝单位根针对自回归替代的零假设












