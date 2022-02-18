function [t,w] = odeRK4()
% Resuelve \dot y=f(y), y(a)=ya, en el intervalo [a,b] con el
% metodo RK4 con paso h=(b-a)/N.
% En la variable t se devuelven los tiempos y en la y los valores.
% De esta forma, w(k) sera (aprox.) y(t=a+kh).
    T = 0.15153;
    a=0;
    b=50*T;
    N = 32*50;
    ya = [1.5 ; 0];
    s1 = 100;
    s2 = 10;
    f = @(t, y) (x = [y(2) ; -s1*y(1)-s1*s2*(y(1)^3)]);


    h=(b-a)/N;
    t=linspace(a,b,N+1);
    w=zeros(length(ya),length(t)); % Para que tenga la dimension correcta desde el principio
    w(:,1)=ya;
    for k=2:N+1
        # orden 4
        #k1=h*f(a,ya);
        #k2=h*f(a+h/2,ya+k1/2);
        #k3=h*f(a+h/2,ya+k2/2);
        #a=a+h;
        #k4=h*f(a,ya+k3);
        #ya=ya+(k1+2*k2+2*k3+k4)/6; % Ahora ya= y(a+kh).
        #w(:,k)=ya;

        # orden 3
        k1= h*f(a,ya);
        k2 = h*f(a+h/2 , ya+k1/2);
        k3 = h*f(a+h , ya - k1 + 2*k2);
        a = a+h;
        ya = ya + (k1 + 4*k2 + k3)/6;
        w(:,k)=ya;
    endfor

endfunction 