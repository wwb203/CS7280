%load coliInter
load('ecoli.mat');
N=max(Edges(:));
A=zeros(N,N);
for i=1:size(Edges,1)
    A(floor(Edges(i,1)),floor(Edges(i,2)))=1;
    A(floor(Edges(i,2)),floor(Edges(i,1)))=1;
end
[S,C]=graphconncomp(sparse(A));
idx=find(C==1);
N=length(idx);
A0=zeros(N,N);
for i=1:N
    for j=(i+1):N
        if A(idx(i),idx(j))==1
            A0(i,j)=1;
        end
    end
end
A0=A0+A0';
A=A0;
coupleList = struct();
for i=1:N
    coupleList(i).list=find(A(i,:)==1)';
end

