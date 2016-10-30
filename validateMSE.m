function [ J,yfinal ] = validateMSE( input, desired, W, M, alpha )
%This is the second step.
%this function finds the Mean Squared error for the various filter coefficients
%the purpose here is to find the best fitting set of parameters on the
%validation data
for i=1:size(M,2)
    for k=1:size(alpha,2)
        w=(i-1)*size(alpha,2)+k;
        X=zeros(M(i),size(input,2)-M(i)+1);
        for j=1:size(input,2)-M(i)+1
            X(1:M(i),j)=(input(1,j+M(i)-1:-1:j)).';
        end;
        Wcurr=W(1:M(i),w);  %taking only wth filter coefficients
        y=Wcurr.'*X;  
        J(i,k)=immse(y,desired(1,M(i):size(desired,2)));  %the prediction y is starting only for (M+1)st and beyond output signals 
        yfinal(1:size(y,2),w)=y.';
    end;
end;
end