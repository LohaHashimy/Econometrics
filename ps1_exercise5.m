function theta_hat = ps1_exercise5(data,a0)
  y = @(x) -loglik(x,data); % finding the maximum using fminunc means taking
                            % the opposite sign of the function
  theta_hat = fminunc(y,a0);
end