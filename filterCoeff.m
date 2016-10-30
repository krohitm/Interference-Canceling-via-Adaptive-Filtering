function[W,Mfinal,alphaFinal,errors]=filterCoeff(input,desired)
%this function serves the first step for Normalized MSE algorithm.
%it finds various filter coefficient sets, for various combinations of Filter Order "M" and learning rater "alpha", using the training data 
i=1;
k=1;
for M=2
    Mfinal(i)=M;
    j=1;
    for alpha=0.001%:0.001:0.1
        Wtemp = zeros(M,1);      %initializing filter coefficients to 0
        [W(1:size(Wtemp),k),errors]=parametersOutput(input,desired,M,alpha,Wtemp);
        alphaFinal(j)=alpha;
        j=j+1;
        k=k+1;
    end;
    i=i+1;
end;
end