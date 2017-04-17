%time takes for synchronization
synDist = zeros(N,N);
label = eye(N,N);
for t=1:size(rho,1)
    for i=1:N
        for j=(i+1):N
            if label(i,j)<1&&rho(t,i,j)>0.5
                synDist(i,j)=t;
                label(i,j)=1;
            end
        end
    end
end
synDist=synDist+synDist';
label=label+label';
synDist(label<1)=t*3;
%build Z for dendrogram
figure;
[H,T,~]=dendrogram(linkage(synDist),0);
%set(gca,'FontSize',16);
