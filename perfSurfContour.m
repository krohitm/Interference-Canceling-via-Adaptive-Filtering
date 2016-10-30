function[Wopt, MSE]=perfSurfContour( alpha, filterOrder, input, desired)
M = filterOrder;
N=size(input,2);
X= zeros(M,N-M+1);

for j=1:N-M+1
    X(1:M,j)=(input(1,j+M-1:-1:j)).';
end;

Wopt = zeros(M,N-M+1);
for t=1:(N-M+1)
    %X=input(1,t+M-1:-1:t).';
    y=Wopt(:,t).'*X(:,t);                                  %you can return y to the calling function, and plot and check
    error=desired(1,t+M-1)-y;                         %desired(1,t+M)-y; %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
    Wopt(:,t+1)=Wopt(:,t)+(alpha*error*X(:,t))/(X(:,t).'*X(:,t));
end;

W1min = min(Wopt(1,:))-0.5;
W1max = max(Wopt(1,:))+0.5;
W2min = min(Wopt(2,:))-0.5;
W2max = max(Wopt(2,:))+0.5;

i=1;
W1 = W1min;
W2 = W2min;
while W1min < W1max
    W1(i) = W1min;
    W1min = W1min+0.01;
    i=i+1;
end;
i=1;
while W2min < W2max
    W2(i) = W2min;
    W2min = W2min+0.01;
    i=i+1;
end;

[w1, w2] = meshgrid(W1,W2);

MSE = zeros(size(w1,1),size(w1,2));

for i=1:size(w1,1)
    for j=1:size(w1,2)
        MSE(i,j) = MSEsurf(w1(i,j), w2(i,j), X, desired, M);
    end;
end;

figure();
contour(W1, W2, MSE, 40);%, 'ShowText', 'on');
xlabel ('Filter coefficient 1: W(1)');
ylabel ('Filter coefficient 2: W(2)');
title ('Performance contour with weight tracks');
colorbar;
%xticks (w1(1,1): 0.25: w1(1,size(w1,2)));
%yticks (w2(1,1): 0.25: w2(size(w2,1),1));
set (gca, 'fontsize', 18);
hold on;

plot (Wopt(1,:),Wopt(2,:), '.');

end