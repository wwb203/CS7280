%plotNetwork
X = zeros(N,1);
Y = zeros(N,1);
Ns1 = 4;%number of supergroup
Ns2 = 4;%number of group
Ns3 = 16;%number of nodes in a group
for i=1:16
    X(i)=mod(i-1,4)+1;
    Y(i)=floor((i-1)/4)+1;
end
for i=17:32
    X(i)=X(i-16)+8;
    Y(i)=Y(i-16);
end
for i=33:64
    X(i)=X(i-32);
    Y(i)=Y(i-32)+8;
end
for i=65:128
    X(i)=X(i-64)+24;
    Y(i)=Y(i-64);
end
for i=129:256
    X(i)=X(i-128);
    Y(i)=Y(i-128)+24;
end
figure('Position',[100,100,800,800]);
hold on

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
                c = [1,0,0];%same L1 and L2
            else
                c = [0,1,0];%same L1 different L2
            end
        else
            c=[0,0,1];%different L1
        end
        if A(i,j)==1
            plot([X(i),X(j)],[Y(i),Y(j)],'-','Color',c);
        end
    end
end
plot(X,Y,'k.','MarkerSize',13);
hold off
axis off
axis equal