A=zeros(length(adjoinList),length(adjoinList));
N=length(adjoinList);
for i=1:floor((length(rawEdge))/2)
j=floor(rawEdge(i*2-1))+1;
k=rawEdge(i*2)+1;
A(j,k)=1;
end
A=A+A';
A=A>0;
coupleList = struct();
for i=1:N
    coupleList(i).list=find(A(i,:)==1)';
end
