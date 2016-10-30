function[y, MSE, error] = finalModelX(W, input, desired, alpha)
M = size(W,1);
N=size(input,2);

for t=1:(N-M+1)
    X=input(1,t+M-1:-1:t).';
    y=W.'*X;                        %you can return y to the calling function, and plot and check
    error(1,t)=desired(1,t+M-1)-y;  %desired(1,t+M)-y; %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
    W=W+(alpha*error(1,t)*X)/(X.'*X);
end;
%y = desired(1,M:N)-y;
y = error;
MSE = (1/size(error,2))*sum(error(1,:).^2);
figure();
plot(1+M:size(y,2)+M,y(1,:));
xlabel ('time index(t)');
ylabel ('signal strength');
title ('final output of actual signal');
set (gca, 'fontsize', 23);
end