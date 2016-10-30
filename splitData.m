function[trainingIn,trainingDes,testIn,testDes]=splitData(input,desired)
%this function separates the data into training,  and testing data
total = size(input,2);
t=((75/100)*total);
trainingIn = input(1, 1:t);       %taking some part of total input data for training the model
trainingDes = desired(1, 1:t);       %taking some part of total desired data for training the model
testIn = input (1, t+1:total);
testDes = desired (1, t+1:total);
%testIn = input(1, 1:t);       %taking some part of total input data for training the model
%testDes = desired(1, 1:t);       %taking some part of total desired data for training the model
%trainingIn = input (1, t+1:total);
%trainingDes = desired (1, t+1:total);