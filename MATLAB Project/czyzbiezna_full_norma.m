function [wynik, Bnorm] = czyzbiezna_full_norma(A)
% Metoda Jacobiego jest zbie¿na, gdy norma nieskoñczona B < 1
% B = D^(-1) * R

tic
% Dekompozycja sparse A (A = D + R)
Dvec = spdiags(A,0); % elementy lezace na diagonali A do wektora
I = speye(size(A)); % macierz identycznosci o rozmiarze A jako sparse
D = spdiags(Dvec,0,I); % macierz D jako sparse (identycznosc z diagonala zmieniona na Dvec)
R = A - D; % reszta jako sparse (sparse A bez elementow z diagonali)

% Odwrotnosc macierzy diagonalnej
% https://s-mat-pcs.oulu.fi/~mpa/matreng/eem1_5-3.htm
Inv_Dvec = 1 ./ Dvec;
Inv_D = spdiags(Inv_Dvec,0,I); % D^(-1) jako sparse (tylko diagonala)

B = Inv_D * R;
Bnorm = norm(B,inf);
%disp(Bnorm);

wynik = 0;
if (Bnorm < 1)
    wynik = 1;
end

toc
end

