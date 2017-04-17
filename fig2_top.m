%dynamic connectivity matrix
Ndis = zeros(nSnapshot,1);
for i=1:nSnapshot
    D = zeros(N,N);
    rho_i = squeeze(rho(i,:,:));
    D(rho_i>0.99)=1;
    D = D-eye(N);
    L = diag(sum(D,2))-D;
    %figure;imshow(D);
    Ndis(i) = length(find(abs(eig(L))<1e-3));
end
figure;%imshow(D);
loglog((1:nSnapshot),Ndis,'-','LineWidth',3);%,'MarkerSize',5);%,1:nSnapshot,Ndis,'.','MarkerSize',15);
ylabel('i');
xlabel('time');
set(gca,'FontSize',16);
    