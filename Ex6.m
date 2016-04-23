% this file will run the OLS and MLE regression of Mincer-type model using
% the data file PSID_income.xls
clear
data = xlsread('PSID_income.xls'); % load data into a matrix
n = length(data);

X = [ones(n,1) data(:,2:6)];
Y = log(data(:,1));

% OLS regression using formula
b_ols = inv(X'*X)*(X'*Y);

% MLE regression
Z = @(B) 1/n*sum((Y - X*B)'*(Y - X*B));
b0 = zeros(size(X,2),1);
b_mle = fminunc(Z,b0);

% display the results
variables = {'const'; 'educ'; 'female'; 'black'; 'ex'; 'ex2'};
T = table(b_ols,b_mle, 'RowNames', variables);
fprintf('The number of observations is %d\n',n) % inform the sample size of
                                                % the estimation  
disp(T)