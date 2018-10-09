function [A, X] = sparsefile(name)
% Funkcja pobiera sparse z pliku name (rozszerzenie .mat)

S = load(name);
A = S.Problem.A;
title = S.Problem.name;

N = nnz(A);
density = N /(size(A,1)*size(A,2));

fprintf('Zaladowano macierz: %s\n', title);
fprintf('Rozmiar macierzy: %dx%d\n', size(A,1),size(A,2));
fprintf('Elementow niezerowych: %d (%.2f%% wypelnienia)\n', N, density*100);
fprintf('Pochodzenie macierzy: %s\n', S.Problem.notes);
fprintf('Autor: %s\n', S.Problem.author);
fprintf('Edytor: %s\n', S.Problem.ed);
fprintf('Rok: %s\n', S.Problem.date);
fprintf('\n');

[A, X] = loaded(A,title);
end
