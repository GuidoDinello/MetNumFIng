#       Pseudo-Codigo
# Requiere: l = {l1,...,ln}z
# Y perteneciente a R^(nxn) no negativa elegida aleatoriamente
# repeat
#   calcular la descomposicion de Y: Y = UTU*
#   X = Py(U,T)
#   Y = X+
# until ||X - Y|| < err

#         Codigo de verda

close all
clear all   #Limpio variabels
clc         #Limpio pantalla

err = 10e-10;

n = randi(10) + 1; #round(rand * intmax);

#Creamos una matriz random perteneciente a R^(nxn)
Y = zeros(n);
for c = 1:n
  for m = 1:n
      Y(c,m) = 10.*rand;
  endfor
endfor

cont = 0; #contador de iteraciones

#l vector lambda aleatorios complejos
if  mod(n,2)  != 0
  l(((n-1)/2)+1) = 21*rand;
endif
for c = 1:floor(n/2)
  l(c) = 21.*rand+21*rand*i;
  l(n-c+1) = l(c)';
endfor



do
# Descomposicion en UTU*, S = T:
  [U,S] = schur(Y,"complex");

# X = Py(U,T)
  Tt = S;                             #T y Tt difieren en la diagonal por definicion
  #l = diag(S);                        #Me quedo con la diagonal de T que es lambda por definicion
  P = perms(l);                       #Creo una matriz P donde cada fila es una permutacion de lambda
  for c = 1:(factorial(n) - 1)       #en cada iteracion me quedo con una permutacion distinta
    Dt = P(c,:)';                     #elijo una permutacion
    Q = l - Dt;                       #lambda techo i - lambda i
    for k = 1:n                 #sumo los cuadrados de las restas
      suma = (abs(Q(k))).^2;               #(lambda techo i - lambda i)^2
      minimo = intmax;                #me quedo con lambda techo i quqe minimiza (sin contar el mismo lambda i)
      if suma < minimo
        Z = Q;                        #me guardo lambda minimo
      endif
    endfor
  endfor
  for m = 1:n
    Tt(m,m) = Z(m);                   #cambio la diagonal de Tt por lambda minimo
  endfor
  X = (U*Tt)*(U');                    #Devuelvo Py


# Caclculo de X+
  Xp = X;
  for c = 1:n
    for m = 1:n
      if real(X(c,m)) < 0
        Xp(c,m) = 0;
      endif
    endfor
  endfor

  Y = Xp;
  cont ++
  A = X - Y;

until (sqrt(trace((X - Y) * ((X - Y)'))) < err || cont > 5000)
errrrr = sqrt(trace((A) * ((A)')))
Y
cont
