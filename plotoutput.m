function[]=plotoutput(W,input,desired)
%this function is used to plot the function on the basis of the learned model, against the actual model, usng test data.

M = size(W,1);
for j=1:size(input,2)-M+1
    X(1:M,j)=(input(1,j+M-1:-1:j)).';
end;
y=W.'*X;
figure();
plot(1+M:size(y,2)+M,y(1,:));
hold on;
plot(1:size(desired,2),desired);
xlabel ('time index (t)');
ylabel ('signal');
title ('actual signal against predicted signal');
legend ('predicted signal', 'actual signal');
set (gca, 'fontsize', 23);
end