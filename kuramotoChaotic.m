function dydt = kuramotoChaotic(t,y,coupleList)
dydt = zeros(length(y),1);
N = length(y);
for i=1:length(y)
    dydt(i)=1+3.87*sum(sin(y(coupleList(i).list)-y(i)))/N;
end
end