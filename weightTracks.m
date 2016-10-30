function [] = weightTracks(filterOrder, learningRate, input, desired)
%this function builds the weight tracks 
M = filterOrder;
alpha = learningRate;
N=size(input,2);
W = zeros(M,N-M+1);
for t=1:(N-M+1)
    X=input(1,t+M-1:-1:t).';
    y=W(:,t).'*X;               %you can return y to the calling function, and plot and check
    error(1,t)=desired(1,t+M-1)-y;          %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
    W(:,t+1)=W(:,t)+(alpha*error(1,t)*X)/(X.'*X);
end;
figure4 = figure;
for i=1:M
    plot (1:size(W,2),W(i,:));
    hold on;
end;
title ('Weight tracks for filter order 2');
xlabel ('No. of samples/time index(t)');
ylabel ('Optimization of weights over time');
legend ('Change in W(1) over time', 'Change in W(2) over time');
set (gca, 'fontsize', 23);