%A为待排序的矩阵，column为按照第几列排序，B为排序之后的矩阵，index为排序之后A的行号索引。
%利用参数varargin实现函数重载
function [B,index]=simulatesort(varargin)
narginchk(1,2);

%当仅输入一个参数A时
if nargin==1
A=varargin{1};
%判断输入A是否为矩阵
if ~ismatrix(A)
    disp('error:输入参数不是矩阵');
    return;
end
for i=size(A,2):-1:1
[tmp,I]=sort(A(:,i));
A=A(I,:);
end
    
%当输入两个参数A和column
else if nargin==2
A=varargin{1};
column=varargin{2};
%判断输入A是否为矩阵
if ~ismatrix(A)
    disp('error:输入参数不是矩阵');
    return;
end
%判断输入向量column是否为行向量
if size(column,1)>1
    disp('error;输入向量column不是行向量');
    return;
end
%向量column的每一个元素必须小于A矩阵列数的正整数
for i=1:1:length(column)
if(column(i)==fix(column(i))&&column(i)>0&&column(i)<=size(A,2))
else
    disp('error:向量column的每一个元素必须小于A矩阵列数的正整数');
    return;
end
end
%用sort实现sortrows
%初始化索引序列I
I=zeros(size(A,1),1);
for i=length(column):-1:1
    [tmp,I]=sort(A(:,column(i)));
    A=A(I,:);
end
  end
   
end
B=A;
index=I;
end



