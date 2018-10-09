function x = jacobi_vec(A, b, d)
% Rozwi�zanie uk�adu r�wna� Ax=b metod� Jacobiego (x, b - wektory)
% d - b��d bezwzgl�dny
N = 1000; % maks liczba iteracji

% Dekompozycja macierzy A (A = D + R)
Dvec = diag(A); % elementy le��ce na diagonali A do wektora
D = diag(Dvec); % diagonala A
R = A - D; % reszta (macierz A bez element�w z diagonali)

% Odwrotno�� macierzy diagonalnej
% https://s-mat-pcs.oulu.fi/~mpa/matreng/eem1_5-3.htm
Inv_Dvec = 1 ./ Dvec;
Inv_D = diag(Inv_Dvec); % D^(-1) te� jest macierz� diagonaln�

T = -1 * Inv_D * R;
C = Inv_D * b;

x = C; % przybli�enie pocz�tkowe
err = Inf(N, 1);
err(1) = norm(A * x - b);
it = 1;

while ((err(it) > d) && (it < N))
    x = T * x + C; % kolejne przybli�enie x
    it = it + 1;
    err(it) = norm(A * x - b);
    %disp(err);
end

fprintf('Liczba wykonanych przybli�e�: %d\n', it);
fprintf('B��d ko�cowy: %d\n', err(it));

Y = err(1:it);
plot(1:it,Y);
end
