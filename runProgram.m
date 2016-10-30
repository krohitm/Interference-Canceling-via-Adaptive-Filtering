function[WOpt,FilterOrder,LearningRate, MSEmin,yFinal, MSEfinal,error, SNR]=runProgram(primary,reference)
%this function collectively runs the steps sequentially.

input = primary;
desired = reference;
[trainingIn, trainingDes, testIn,testDes]=splitData(input,desired);
[W,M,alpha]=filterCoeff(trainingIn,trainingDes);
%[ MSE, y ] = validateMSE( testIn,testDes, W, M, alpha );
[ MSE] = validateMSEX( testIn,testDes, W, M, alpha );
[WOpt,k,l,MSEmin]=optimumW(MSE,W,M);
%plotMSE(alpha,M,MSE);             %to be used in case of multiple filter orders and multiple learning rates
%plotoutput(WOpt, testIn, testDes);
learningCurve(M(k),alpha(l),trainingIn,trainingDes);
FilterOrder = M(k);
LearningRate = alpha(l);
%perfSurfContour(LearningRate, FilterOrder, trainingIn, trainingDes);                     %to be used only in case of filter order 2, to create performance surface contour 
%weightTracks(FilterOrder, LearningRate, trainingIn, trainingDes);
%[yFinal] = finalModel(WOpt, input, desired);
%[yFinal, MSEfinal, error] = finalModelX (WOpt, input, desired, LearningRate);
%[SNR] = ERLE(M, desired, error);

end