%MLE using fminunc
function theta_hat = EX5(data,a0)
  y = @(x) -loglik(x,data); % Since we want to take the max we have to put the minus sign
  theta_hat = fminunc(y,a0);
end