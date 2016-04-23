% This file will import the data from NerloveData.m and run the regression of
% the Nerlove model
clc
data = load('NerloveData.m'); % load data from Nerlove experiment, variables from
			      % column 2 to 6 are: TC, Q, PL, PF, PK
X = [ones(length(data),1) log(data(:,3:6))]; % matrix of regressors with natural
					     % logarith of Q, PL, PF and PK
k = size(X,2) - 1; % number of explanatory variables
n = length(X); % sample size

Y = log(data(:,2)); % matrix of dependent variable TC
funcLS = @(B) sum((Y - X*B)'*(Y - X*B)); % define the LS function
B0 = zeros(size(X,2),1); % generate the estimation point
b_ols = fminunc(funcLS, B0); % generate estimators

Y_bar = sum(Y)/size(Y,1);
Y_hat = X*b_ols;
U_hat = Y - X*b_ols;
sigma_u = sqrt(1/(n-k-1)*(sum(U_hat.^2))); % residual variance
cov_matrix = sigma_u^2*inv(X'*X); % generate covariance matrix
std_err = diag(sqrt(cov_matrix)); % generate a column matrix of standard error of
				 % estimators, which is the diagonal of the
				 % covariance matrix

% display result
variables = {'const'; 'Q'; 'PL'; 'PF'; 'PK'};
q = table(b_ols,std_err, 'RowNames',variables)
oservations = n
adj_R_squared = 1- (n-1)/(n-k-1)*(sum(U_hat.^2)/sum((Y - Y_bar).^2))
residual_variance = sigma_u