function [D, R, I, Dvec] = decompose(A, issparse)
% Dekompozycja macierzy A (A = D + R)

if(issparse == 1)
    Dvec = spdiags(A,0); % elementy lezace na diagonali A do wektora
    I = speye(size(A)); % macierz identycznosci o rozmiarze A jako sparse
    D = spdiags(Dvec,0,I); % macierz D jako sparse (identycznosc z diagonala zmieniona na Dvec)
    R = A - D; % reszta jako sparse (sparse A bez elementow z diagonali)
else
    Dvec = diag(A); % elementy lezace na diagonali A do wektora
    I = eye(size(A)); % macierz identycznosci o rozmiarze A
    D = diag(Dvec); % diagonala A
    R = A - D; % reszta (macierz A bez elementow z diagonali)
end
