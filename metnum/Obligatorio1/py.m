function P = Py(U,T,n)
  Tt = T;                             #T y Tt difieren en la diagonal por definicion
  l = diag(T);                        #Me quedo con la diagonal de T que es lambda por definicion
  P = perms(l);                       #Creo una matriz P donde cada fila es una permutacion de lambda
  for c = 1:factorial(n)       #en cada iteracion me quedo con una permutacion distinta
    Dt = P(c,:)';                     #elijo una permutacion
    Q = l - Dt;                       #lambda techo i - lambda i
    for k = 1:n                 #sumo los cuadrados de las restas
      suma = sqr(Q(k));               #(lambda techo i - lambda i)^2
      minimo = intmax;                #me quedo con lambda techo i quqe minimiza (sin contar el mismo lambda i)
      if suma < minimo && suma =! 0
        Z = Q;                        #me guardo lambda minimo
      endif
    endfor
  endfor
  for m = 1:n
    Tt(m,m) = Z(m);                   #cambio la diagonal de Tt por lambda minimo
  endfor
  P = (U*Tt)*(U');                    #Devuelvo Py
endfunction
