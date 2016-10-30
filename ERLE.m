function[SNR] = ERLE(M, desired, error)
N = size(desired,2);
%d = meansqr(desired(1,M:N));
d = desired.^2;
e = error.^2;
%SNR = zeros(N-M+1);
for i=1:N-M+1
    SNR(i) = 10*log(d(1,i+M-1)/e(1,i));
end;
plot(1:size(SNR,2),SNR(1,:));
xlabel('number of iteration');
ylabel('Signal to Noise ratio');
title('Improvement in signal to noise ratio');
set (gca, 'fontsize', 18);
ylim([-400 400]);
end