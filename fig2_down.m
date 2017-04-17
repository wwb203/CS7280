L = diag(sum(A))-A;
e = eig(L);
e = e(e>=1);
e = sort(e);
figure
loglog(1./e,1:length(e),'o-');
xlabel('1/\lambda_i');
ylabel('i');
xlim([min(1./e),1.05])
set(gca,'FontSize',18);