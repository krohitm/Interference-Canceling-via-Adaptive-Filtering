function[MSE] = MSEsurf(W1, W2, X, desired, M)
%using for performance contour
W= [W1; W2];
y = W.'*X;
MSE = immse(y,desired(1,M:size(desired,2)));