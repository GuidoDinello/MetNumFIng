n_s = [5,10,15,25,30,45,50,65,85,100];

#function reinicia_variables
#	close all
#	clear all
#	clc
#endfunction
errores = [0,0,0,0,0,0,0,0,0,0];
iteraciones = errores;
for i=1:2	#Para cada n de los 10 que elegimos
	#for j=1:100
		[errores(i),iteraciones(i)] =algoritmo1P2(n_s(i));
		clc;
	#endfor
endfor
plot(n_s,errores)
errores
iteraciones
#[t,l_x,l_y]=table(x,y)
