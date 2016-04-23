N=1000000; 
x = rand(N,1); % generate the variable x with uniform distribution (0,1)
B = [1; -1]; % True function coefficients
U = randn(N,1); % error term that is distributed normaly~(0,sigma_sqr)
X = [ones(N,1) x.^2]; % True function matrix with the intercept
Y = X*B + U; % generate true variable Y 
X1 = [X(:,1) x]; %misspecified model y = a + bx + v
b_hat = inv(X1'*X1)*(X1'*Y) % using OLS formula to find the OLS estimators