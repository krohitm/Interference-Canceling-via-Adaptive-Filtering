function [ MSE ,y ] = validateMSEX( input, desired, W, M, alpha )
N=size(input,2);

MSE = zeros(size(M,2),size(alpha,2));
for i=1:size(M,2)
    for k=1:size(alpha,2)
        w=(i-1)*size(alpha,2)+k;
        Wcurr = W(1:M(i),w);
        error = zeros(1,N-M+1);
        for t=1:(N-M+1)
            X=input(1,t+M-1:-1:t).';
            y=Wcurr.'*X;                        %you can return y to the calling function, and plot and check
            error(1,t)=desired(1,t+M-1)-y;  %desired(1,t+M)-y; %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
            Wcurr=Wcurr+(alpha(1,k)*error(1,t)*X)/(X.'*X);
        end;
        MSE(i,k) = (1/size(error,2))*sum(error(1,:).^2);
    end;
end;
%y = desired(1,M:N)-y;
%y = error;
