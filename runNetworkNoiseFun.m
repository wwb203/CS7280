function rho=runNetworkNoiseFun(Nrepeat,T,nSnapshot,subN,N,kappa,coupleList)
rho = zeros(nSnapshot,N,N);
dt = T/nSnapshot/subN;
parfor i=1:Nrepeat
    y=zeros(N,nSnapshot);
    y(:,1)=rand(N,1)*2*pi;
    for j=2:nSnapshot
        y1=y(:,j-1);
        for k=1:subN
            dydt=kuramoto(0,y1,coupleList);
            y1 = y1 ...
                + dydt.*dt ...
                + (2*rand(size(y1))-1)*sqrt(kappa)*sqrt(dt);
        end
        y(:,j)=y1;
    end
    tmp = zeros(nSnapshot,N,N);
    for j=1:nSnapshot
        for m=1:N
            for n=1:N
                tmp(j,m,n)=cos(y(m,j)-y(n,j));
            end
        end
    end
    rho = rho + tmp;
end
for j=1:nSnapshot
    tmp = squeeze(rho(j,:,:));
    rho(j,:,:)= tmp/Nrepeat;
end