function[]=plotMSE(alpha,M,MSE)
%this is the 4th step
%this function gives a 3D plot of Mean Square Error against various choices
%of filter order and learning rate that we chose while validating.
figure1 = figure;
axes1 = axes('Parent',figure1);
surf(alpha,M,MSE);
xlabel({'Learning Rate'});

% Create zlabel
zlabel({'Mean Square Error'});

% Create title
title({'Mean Square Error using validation data'});

% Create ylabel
ylabel({'Filter Order'});



view(axes1,[71.7000000000001 44.4]);
grid(axes1,'on');
% Create colorbar
colorbar('peer',axes1);
set (gca, 'fontsize', 23);
end