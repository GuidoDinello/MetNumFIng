function M = nonNegX(X,n)
  M = X;
  for c = 1:n
    for m = 1:n
      if X(c,m) < 0
        M(c,m) = 0;
      endif
    endfor
  endfor
endfunction
