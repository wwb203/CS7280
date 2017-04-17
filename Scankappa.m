coupleList=funBuildRB();
N=25;
T=200;
Nrepeat=200;
nSnapshot=200;
subN = 30;
kappaList=[0,0.05,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];%,0.2,0.4,0.8,1.6];
numComponent = zeros(size(kappaList));
threshold=0.9;
rhoCell = cell(length(kappaList),1);
for i=1:length(kappaList)
rho=runNetworkNoiseFun(Nrepeat,T,nSnapshot,subN,N,kappaList(i),coupleList);
rhoCell{i,1}=rho;
numComponent(i) = funNumComponent(rho,N,threshold);
end
figure;
plot(kappaList,numComponent);
figure;
hold on
for t=[50,100,150,200];
for i=1:length(kappaList)
    tmp=rhoCell{i,1};
    tmp=squeeze(tmp(t,:,:));
    meanD(i)=mean(tmp(:));
    stdD(i)=std(tmp(:));
end
errorbar(kappaList,meanD,stdD)
end
legend('T=50','T=100','T=150','T=200');
hold off
