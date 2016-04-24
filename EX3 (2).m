clear all;
close all;
clc;
A= xlsread('NerlovData.xlsx');
X = [ones(length(A),1) log(A(:,3:6))];%generating the log 
n = length(X);%number of observations
Y = log(A(:,2)); %generating the log variable of Total Cost Variable
k = size(X,2) - 1; %The number of explainatory variables that we have in the model
LS_Fun = @(B) sum((Y - X*B)'*(Y - X*B)); % defining a function for the Least Sqr
B0 = zeros(size(X,2),1); % generating the initial estimation point
b_ols = fminunc(LS_Fun, B0) % Calculating OLS estimators
Y_bar = sum(Y)/size(Y,1);%generating mean of variable y
Y_hat = X*b_ols;%generating estimated y
U_hat = Y - X*b_ols;%generating matrix of estimated residuals 
sigma_u = sqrt(1/(n-k-1)*(sum(U_hat.^2))); % residual variance
cov_matrix = sigma_u^2*inv(X'*X); % generate covariance matrix
std_err = diag(sqrt(cov_matrix)) % generate a column matrix of stnd-error of
% estimators, which is the diagonal of the covariance matrix
adj_R_squared = 1- (n-1)/(n-k-1)*(sum(U_hat.^2)/sum((Y - Y_bar).^2))
resid_var = sigma_u
obs=n