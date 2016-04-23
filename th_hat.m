function th_hat = th_hat(data,a0)
  y = @(x)loglik(x,data)
  theta_ml = fminunc(y,a0)
end