function[y] = finalModel(WOpt, input, desired)
M = size(WOpt,1);
N=size(input,2);
for j=1:N-M+1
    X(1:M,j)=(input(1,j+M-1:-1:j)).';
end;
y=WOpt.'*X;
y = desired(1,M:N)-y;
figure();
plot(1+M:size(y,2)+M,y(1,:));
xlabel ('time index(t)');
ylabel ('signal strength');
title ('final output of only signal');
set (gca, 'fontsize', 23);
end