function [wynik, mindiff] = czyzbiezna_full_diagdom(A)
% Sprawdzenie warunku wystarczaj�cego zbie�no�ci metody Jacobiego dla
% macierzy A (macierz A musi by� silnie diagonalnie dominuj�ca)

tic
% Dekompozycja sparse A
Dvec = spdiags(A,0); % elementy lezace na diagonali A do wektora
I = speye(size(A)); % macierz identycznosci o rozmiarze A jako sparse
D = spdiags(Dvec,0,I); % macierz D jako sparse (identycznosc z diagonala zmieniona na Dvec)
R = A - D; % reszta jako sparse (sparse A bez elementow z diagonali)

% Zamiana na wartosci bezwzgledne
Dvec = abs(Dvec);
D = abs(D);
R = abs(R);

Rsum = sum(R,2); % suma wierszy Ar

diff = Dvec - Rsum; % roznice modulow wartosci na diagonali od sumy pozosta�ych 
mindiff = min(diff); % najmniejsza roznica

% Jesli wszystkie s� nieujemne, zwr�� 1; przeciwnie zwr�� 0
k = find(diff < 0, 1);

wynik = 0;
if(isempty(k))
    wynik = 1;
end

toc
end

