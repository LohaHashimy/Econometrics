
function obj = log_MLE(theta,data)
  n = length(data);
  y = @(x) -n*x + log(x)*sum(data) - sum(log(factorial(data))); 
  %it follows from the 5.b
  obj = y(theta);
end