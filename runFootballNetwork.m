buildNetworkFootball

T = 200;

nSnapshot = 200;
%rho = zeros(nSnapshot,N,N);
Nrepeat = 500;
rho=funRunNetwork(Nrepeat,T,nSnapshot,N,coupleList);
fig2_top
% figure;
% hold on
% tList=[50,100,150,200];
% meanD=zeros(size(tList));
% stdD =zeros(size(tList));
% for i=1:length(tList)
%     tmp=squeeze(rho(tList(i),:,:));
%     meanD(i)=mean(tmp(:));
%     stdD(i)=std(tmp(:));
% end
% errorbar(tList,meanD,stdD)
% hold off
