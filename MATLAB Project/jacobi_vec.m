function x = jacobi_vec(A, b, d)
% Rozwi¹zanie uk³adu równañ Ax=b metod¹ Jacobiego (x, b - wektory)
% d - b³¹d bezwzglêdny
N = 1000; % maks liczba iteracji

% Dekompozycja macierzy A (A = D + R)
Dvec = diag(A); % elementy le¿¹ce na diagonali A do wektora
D = diag(Dvec); % diagonala A
R = A - D; % reszta (macierz A bez elementów z diagonali)

% Odwrotnoœæ macierzy diagonalnej
% https://s-mat-pcs.oulu.fi/~mpa/matreng/eem1_5-3.htm
Inv_Dvec = 1 ./ Dvec;
Inv_D = diag(Inv_Dvec); % D^(-1) te¿ jest macierz¹ diagonaln¹

T = -1 * Inv_D * R;
C = Inv_D * b;

x = C; % przybli¿enie pocz¹tkowe
err = Inf(N, 1);
err(1) = norm(A * x - b);
it = 1;

while ((err(it) > d) && (it < N))
    x = T * x + C; % kolejne przybli¿enie x
    it = it + 1;
    err(it) = norm(A * x - b);
    %disp(err);
end

fprintf('Liczba wykonanych przybli¿eñ: %d\n', it);
fprintf('B³¹d koñcowy: %d\n', err(it));

Y = err(1:it);
plot(1:it,Y);
end
