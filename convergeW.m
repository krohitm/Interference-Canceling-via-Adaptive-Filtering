function [W] = convergeW(M, input, desired)
N = size(input,2);
X=zeros(M,N-M+1);
for j=1:N-M+1
    X(1:M,j)=(input(1,j+M-1:-1:j)).';
end;
Y = desired(1,M:size(desired,2));
R = X*X.';
P = X*Y.';
W= pinv(R)*P;