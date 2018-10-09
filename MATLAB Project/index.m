d = 0.001; % maks blad
N = 1000; % maks liczba iteracji

fprintf('Odwracanie macierzy rozrzedzonych metoda Jacobiego.\n\n');

filelinks = findfiles();

if(isempty(filelinks))
    fprintf('Nie znaleziono zadnych plikow .mat!\n');
    fprintf('<a href="https://www.cise.ufl.edu/research/sparse/matrices/Boeing/">%s</a>','Poszukaj rozrzedzonych macierzy tutaj');
    fprintf(' i wklej je w plikach .mat do katalogu ''Sparses''.\n');
else
    fprintf('Wybierz macierz do odwrocenia:\n');
    disp(filelinks);
end
fprintf('\n');
