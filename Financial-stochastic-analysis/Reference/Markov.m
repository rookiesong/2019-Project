clc;
clear;
S0=4;
p=0.5;
u=2;
d=0.5;
N=3;
r=0.25;
state{1}=[S0,S0,0];

for nn=1:N
    state{nn+1}=[];
    for jj=1:size(state{nn},1)
        M=state{nn}(jj,1);
        S=state{nn}(jj,2);
        NM=max(M,u*S);
        NS=u*S;
        state{nn+1}=add2Sate(state{nn+1},NM,NS);
        NM=max(M,d*S);
        NS=d*S;
        state{nn+1}=add2Sate(state{nn+1},NM,NS);
    end
end

for jj=1:size(state{end},1)
   state{end}(jj,3)=state{end}(jj,1)-state{end}(jj,2); 
end

for nn=length(state)-1:-1:1
for jj=1:size(state{nn},1)
      M=state{nn}(jj,1);
      S=state{nn}(jj,2);
      NM=max(M,u*S);
      NS=u*S;
      index=find(state{nn+1}(:,1)==NM & state{nn+1}(:,2)==NS);
      v1=state{nn+1}(index,3);
      NM=max(M,d*S);
      NS=d*S;
      index=find(state{nn+1}(:,1)==NM & state{nn+1}(:,2)==NS);
      v2=state{nn+1}(index,3);
      state{nn}(jj,3)=(p*v1+p*v2)/(1+r);
      
end
end

v0=state{1}(1,3)

