#           Pseudo-Código
#  Requiere: l = {l1,...,ln}, con l1 >= ... >= ln
#  Y pertence a T elegida aleatoriamente
#  repeat
#    calular la descomposicion en VAPs y VEPs de Y: Y = V * diag(m1,...,mn) * V^t, m1 >= ... >= mn
#    X := V * diag(l1,...,ln) * V^t
#    X := 0.5 * (X + X^t)
#    Y := X+
#  until ||X - Y|| < err

#         Código de verdad

#close all
#clear all   #Limpio variables
#clc         #Limpio pantalla

function [errrrrr,cont] = algoritmo1P2(n)

	clc 

	#n = randi(100);
	err = 10e-10;
	Y = zeros(n);

	# Creamos una matriz random perteneciente a T: matriz simetrica no negativa
	for c = 1:n
	  for m = 1:n
	    if c <= m
	      Y(c,m) = 10.*rand;
	      Y(m,c) = Y(c,m);
	    endif
	  endfor
	endfor

	Y;

	cont = 0; #contador de iteraciones

	#D2 matriz con espectro lambda aleatorios reales
	D2 = zeros(n);
	for c = 1:n
	  D2(c,c) = 21.*rand;
	endfor

	do
	  cont = cont + 1;
	# Descompoicision en VAPs y VEPs
	  [P,D] = eig(Y);
	  #P #VEPs asociados a los vaps de D en orden
	  #D #VAPs de lamatrizY en la diagonal de Y

	  X = (P * D2) * P'; #P' P transpuesta
	  X = (0.5) .* (X + X'); #.* multiplicacion escalar

	# Caclculo de X+
	  Xp = X;
	  for c = 1:n
	    for m = 1:n
	      if X(c,m) < 0
		Xp(c,m) = 0;
	      endif
	    endfor
	  endfor

	  Y = Xp;
	  errrrrr = sqrt(trace((X - Y) * (X - Y)));
	  cont = cont;
	  #X
	  #Y
	until (sqrt(trace((X - Y) * (X - Y))) < err || cont > 1000)
	Y;
	[P,D] = eig(Y);
	D2;
	cont;
	errrrrr;

endfunction
