%dynamic connectivity matrix
function numComponent = funNumComponent(rho,N,threshold)
Ndis = size(rho,1);%zeros(nSnapshot,1);
for i=1:Ndis
    D = zeros(N,N);
    rho_i = squeeze(rho(i,:,:));
    D(rho_i>threshold)=1;
    D = D-eye(N);
    L = diag(sum(D,2))-D;
    %figure;imshow(D);
    Ndis(i) = length(find(abs(eig(L))<1e-5));
end
numComponent=Ndis(end);
% figure;%imshow(D);
% loglog((1:nSnapshot)*T/nSnapshot,Ndis,'-','LineWidth',3);%,'MarkerSize',5);%,1:nSnapshot,Ndis,'.','MarkerSize',15);
% ylabel('i');
% xlabel('time');
% set(gca,'FontSize',16);
    