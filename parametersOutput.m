function [ W,error ] = parametersOutput( input,desired,M,alpha,W )
%This function is called by the first function filterCoeff.
%this function is being used to get a set of parameter W for a combination
%of Filter Order "M" and regularization parameter "lambda" using the formula W=pinv(R+lambda)*P
N=size(input,2);
for t=1:(N-M+1)
    X=input(1,t+M-1:-1:t).';
    y=W.'*X;                        %you can return y to the calling function, and plot and check
    error(1,t)=desired(1,t+M-1)-y;  %desired(1,t+M)-y; %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
    W=W+(alpha*error(1,t)*X)/(X.'*X);
end;
end