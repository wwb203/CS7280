%run dynamics
%function runRandomNetwork(N)
clear
buildNetworkfig3;

T = 50;

nSnapshot = 200;
rho = zeros(nSnapshot,N,N);
Nrepeat = 1000;
tspan = [0 T];
options = odeset('RelTol',1e-8);
parfor i=1:Nrepeat
sol = ode45(@(t,y) kuramoto(t,y,coupleList),tspan,rand(N,1)*2*pi,options);
x = linspace(0,T,nSnapshot);
y = deval(sol,x);
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

rowPlot = ceil(sqrt(nSnapshot));
figure('Position',[0,0,1024,1024])
title('Ravas-Barabasi');
X=linspace(0,1,256)';
Y=linspace(1,0,256)';
mymap=cat(2,X,zeros(256,1),Y);
for i=1:nSnapshot
    subplot(rowPlot,rowPlot,i)
    tmp = squeeze(rho(i,:,:));
    Ir = round(tmp*256);
    Ib = round((1-tmp)*256);
    Ig = zeros(N,N);
    Irgb = cat(3,Ir,Ig,Ib);
    imshow(Irgb);
%     tmp=squeeze(rho(j,:,:));
%     Ir = tmp;
%     Ir = Ir-0.5;
%     Ir(tmp<0.5)=0;
%     Ib = tmp;
%     Ib = 0.5-Ib;
%     Ib(tmp>=0.5)=0;
%     Irgb = cat(3,Ir*256,zeros(N,N),Ib*256);
colormap(mymap);
%     tmp = squeeze(rho(i,:,:));
%     tmp(tmp>(1-1e-2))=1;
     imagesc(tmp,[0,1]);
    title(sprintf('t=%.1f',i/nSnapshot*T));
end
% L = diag(sum(A))-A;
% e = eig(L);
% e = e(e>=1);
% e = sort(e);
% figure
% loglog(1./e,1:length(e));
% ylim([1,256]);
% xlim([min(1./e)/2,1]);