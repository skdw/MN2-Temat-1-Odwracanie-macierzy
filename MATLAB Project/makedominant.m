function [X, int_coeff] = makedominant(A)
% Uzyskanie macierzy silnie diagonalnie dominujacej poprzez dodanie
% odpowiedniej stalej do kazdej wartosci glownej przekatnej macierzy/sparse

[wynik, mindiff] = czyzbiezna_full_diagdom(A);
int_coeff = ceil(-mindiff);

if(wynik == 1)
    X = A;
    fprintf('Macierz jest juz silnie diagonalnie dominujaca.\n');
else
    X = A + (int_coeff .* speye(size(A)));
    fprintf('Nowa macierz silnie diagonalnie dominujaca: A + %d * I\n', int_coeff);
end

end
