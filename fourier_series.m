% POST-GRADUATION SPECIALIZATION OF MECHANICAL ENGINEERING (PGMEC - SE/4)
% BRAZILIAN ARMY'S MILITARY INSTITUTE OF ENGINEERING (IME)
% AUTHOR:    Wallace Ramos Rosendo da Silva
% CLASS:     Applied Mathematics to Mechanical Engineering
% PROFESSOR: Marcio Violante Ferreira

function fourier_series(L,n,dx)

% Assigning variable "ex18" to piecewise function of Exercise 17
% of Page 556
[fun,vecx] = ex18_pag556(L,dx);

% Creating variable "a0" as part of Fourier Series:
% integration of ex18     => a0
% interval of integration => [-6L;6L]
% variable of integration => x
a0 = (1/2*L)*integral(fun,vecx(1),vecx(end));

% Creating symbolic vectors to store results of Fourier Series
a = sym('a',[1 n]);
b = sym('b',[1 n]);
ff_series = sym('fs_%d',[1 n]); 
ff_series(1) = a0; 

% Iteration of an & bn
for i = 1:n    
    a(i) = (1/L)*int(ex18*cos(i*pi*x/L),x); % Coefficient of Cosine series
    b(i) = (1/L)*int(ex18*sin(i*pi*x/L),x); % Coefficient of Sine series
    ff_series(i+1) = a0 + a(i)*cos(i*pi*x/L) + b(i)*sin(i*pi*x/L); % Calculating the Fourier Series
end

% Plotting comparison between f(x) and approximation by Fourier Series
fplot(ex18,'Linewidth',2)    
hold on
grid on
fplot(ff_series,'-o')
title('Fourier Series of Ex.18')
xlabel('x');
ylabel('y');
hold off
end  