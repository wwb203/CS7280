%function coupleList=funBuildRB();
A=zeros(25,25);
N=25;
for i=1:5
    startid=(i-1)*5+1;
    endid = startid+4;
    for j=startid:endid
        for k=(j+1):endid
            A(j,k)=1;
        end
    end
end
A(1,2:25)=1;
A(1,6:5:21)=0;
A=A+A';
coupleList = struct();
for i=1:N
    coupleList(i).list=find(A(i,:)==1)';
end
