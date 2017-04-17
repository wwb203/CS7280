i=31;    
D = zeros(N,N);
    rho_i = squeeze(rho(i,:,:));
    D(rho_i>0.99)=1;
    D = D-eye(N);
    figure;imshow(D)
    L = diag(sum(D,2))-D;
    %figure;imshow(D);
    Ndis(i) = length(find(abs(eig(L))<1e-5));