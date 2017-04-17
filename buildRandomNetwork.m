function [A,coupleList]=buildRandomNetwork(zin2,zin3)
%build hierarchical network
rng('shuffle');
Ns1 = 4;%number of supergroup
Ns2 = 4;%number of group
Ns3 = 16;%number of nodes in a group
N = Ns1*Ns2*Ns3;%total number of nodes
%zlist(1) is number of edges to nodes outside supergroup
%zlist(2) is number of edges to nodes outside group but within supergroup
%zlist(3) is number of edges to nodes within group
zlist = [1,zin2,zin3];
p33 = zlist(3)/(Ns3-1);%prob. of edge between nodes in group
p32 = zlist(2)/((Ns2-1)*Ns3);%prob. of edge across group
p31 = zlist(1)/((Ns1-1)*Ns2*Ns3);%prob. of edge across supergroup
A = zeros(N,N);%initalize adjacency matrix
for i=1:N
    %communiity ID of node i
    Li1 = floor((i-1)/(Ns2*Ns3));
    tmp = i - Li1*Ns2*Ns3;
    Li2 = floor((tmp-1)/Ns3);
    for j=(i+1):N
        %community ID of node j
        Lj1 = floor((j-1)/(Ns2*Ns3));
        tmp = j - Lj1*Ns2*Ns3;
        Lj2 = floor((tmp-1)/Ns3);
        %identity level
        if Li1==Lj1
            if Li2==Lj2
                p = p33;%in the same group
            else
                p = p32;%across groups
            end
        else
            p=p31;%across supergroup
        end
        %add edge randomly
        if rand()<p
            A(i,j)=1;
        end
    end
end
%fill in the lower half of A
A = A + A';
%adjecency list
coupleList = struct();
for i=1:N
    coupleList(i).list=find(A(i,:)==1)';
end
end
