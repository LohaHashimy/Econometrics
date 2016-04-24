%comparing the OLS and MLE results of Mincer-Type model.
clear all;
close all;
clc;
A = xlsread('PSID_income.xls'); 
n = length(A);

X = [ones(n,1) A(:,2:6)];
Y = log(A(:,1));

% OLS estimator
b_ols = inv(X'*X)*(X'*Y)

% MLE estimator
G = @(B) 1/n*sum((Y - X*B)'*(Y - X*B));
b0 = zeros(size(X,2),1);
b_mle = fminunc(G,b0)
