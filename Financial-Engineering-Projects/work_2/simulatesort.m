%AΪ������ľ���columnΪ���յڼ�������BΪ����֮��ľ���indexΪ����֮��A���к�������
%���ò���vararginʵ�ֺ�������
function [B,index]=simulatesort(varargin)
narginchk(1,2);

%��������һ������Aʱ
if nargin==1
A=varargin{1};
%�ж�����A�Ƿ�Ϊ����
if ~ismatrix(A)
    disp('error:����������Ǿ���');
    return;
end
for i=size(A,2):-1:1
[tmp,I]=sort(A(:,i));
A=A(I,:);
end
    
%��������������A��column
else if nargin==2
A=varargin{1};
column=varargin{2};
%�ж�����A�Ƿ�Ϊ����
if ~ismatrix(A)
    disp('error:����������Ǿ���');
    return;
end
%�ж���������column�Ƿ�Ϊ������
if size(column,1)>1
    disp('error;��������column����������');
    return;
end
%����column��ÿһ��Ԫ�ر���С��A����������������
for i=1:1:length(column)
if(column(i)==fix(column(i))&&column(i)>0&&column(i)<=size(A,2))
else
    disp('error:����column��ÿһ��Ԫ�ر���С��A����������������');
    return;
end
end
%��sortʵ��sortrows
%��ʼ����������I
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



