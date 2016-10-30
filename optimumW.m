function[WOpt,k,l,MSEmin]=optimumW(J,W,M)
%this is the 3rd step.
%this function returns the optimum set W of paramters, in terms of minimum MSE
%it also returns the index of the corresponding Filter Order from Mfinal
w=1;
k=1;
l=1;
WOpt = W(1:M(k),w);
for i=1:size(J,1)
    for j=1:size(J,2)
        if J(i,j)<J(k,l)
            WOpt=W(1:M(i),w);
            k=i;
            l=j;
        end;
        w=w+1;
    end;
end;
MSEmin=J(k,l);
end