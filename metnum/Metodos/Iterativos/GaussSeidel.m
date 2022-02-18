function [x] = GaussSeidel(x0, b, A, steps)
	L = tril(A,-1);
	U = triu(A,1);
	D = diag(diag(A));

	L_D_inv = inv(L+D);
	Qgs = - L_D_inv*U;
	rgs = L_D_inv*b;

	x = [x0];
	x_prev = x0;
	for i=1:steps
		x_sig = Qgs*x_prev + rgs;
		x = [x x_sig];
		x_prev = x_sig;
	endfor


endfunction