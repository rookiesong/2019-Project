function state=add2Sate(state,NM,NS)
index=[];
if(size(state,1))
    index=find(state(:,1)==NM & state(:,2)==NS);
end
if(length(index)==0)
    state=[state;[NM,NS,0]];
end
end