clear all;
close all;
clc;
n=1000000; 
x = rand(n,1); % generating a random uniformly distributed variable, x  
B = [1; -1]; % True coefficients of Beta
E = randn(n,1); % error term that is distributed normaly~(0,sigma_sqr)
X = [ones(n,1) x.^2]; % True function matrix with the intercept
Y = X*B + E; % generating true variable Y 
X_mis = [X(:,1) x]; %misspecified model y = a + bx + v
b_hat = inv(X_mis'*X_mis)*(X_mis'*Y) % finding estimator using OLS