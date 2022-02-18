
function [x] = Jacobi(x0, b, A, steps)
%The functions triu (a, k) and tril (a, k) extract the upper or lower triangular part of the matrix a, 
%and set all other elements to zero. The second argument is optional, and specifies how many diagonals 
%above or below the main diagonal should also be set to zero. 

	L = tril(A,-1);
	U = triu(A,1);
	D = diag(diag(A));
	Dinv = inv(D);
	Qj = - Dinv*(L+U);
	rj = Dinv*b;

	x = [x0];
	x_prev = x0;
	for i=1:steps
		x_sig = Qj*x_prev + rj;
		x = [x x_sig];
		x_prev = x_sig;
	endfor

endfunction
