function[]=learningCurve(M,alpha,input,desired)
%this function plots a graph of the optimum learning rate against 2 smaller
%learning rates to show that the chosen learning rate learns faster
N=size(input,2);
alpha(1)=alpha;
%figure3 = figure;
alpha(2) = alpha(1)/2;%+alpha(1)/2;
alpha(3) = alpha(1)*2;%-alpha(1)/2;
for i=1:3
    W=zeros(M,1);
    for t=1:(N-M)
        X=(input(1,t+M-1:-1:t)).';
        y=W.'*X;
        error(t,i)=desired(1,t+M)-y;
        E (t)=meansqr(error(:,i));%sum(error(:,i).^2)
        W=W+(alpha(i)*error(t,i)*X)/(X.'*X);
    end;
    %plot(1:size(error,1),error(:,i).^2);
    plot(1:size(E,2),E(1,:));
    hold on;
    %ylabel('prediction error');
   % xlabel('Time index (t)');
  %  title(['Learning Curve for learning rate ' num2str(alpha(i))]);
    %legend(['learning rate=' num2str(alpha(i))]);
 %   set (gca, 'fontsize', 18);
    %ylim([0 100]);
end;
%plot(1:size(E,1),E(:,1));
%hold on;
%plot(1:size(E,1),E(:,2));
%plot(1:size(E,1),E(:,3));
ylabel('prediction error');
xlabel('Time index (t)');
title('Learning Curve for various learning rates ' );
legend (['learning rate=' num2str(alpha(1))],['learning rate=' num2str(alpha(2))], ['learning rate=' num2str(alpha(3))]);
%legend(['learning rate=' num2str(alpha(i))]);
set (gca, 'fontsize', 18);
    %ylim([0 100]);
end        