for i=2:100
  for j=2:100
    if(~mod(i,j))
      break
    end
  end
  %fprintf('%d is prime\n, i');
  if(j > i/j)
    fprintf('%d is prime\n', i);
  end
end
  