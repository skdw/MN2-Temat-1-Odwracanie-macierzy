function [A, X] = loaded(A, tytul)
% Wyœwietla komunikaty po zaladowaniu sparse

figure('Name','Struktura niezerowych elementow macierzy','NumberTitle','off');
spy(A);
title(tytul);

%%%%%%

[zb, Bnorm] = czyzbiezna_full_norma(A);
if(zb == 1)
    disp('Metoda Jacobiego zastosowana do tej macierzy jest zbiezna');
else
    disp('Metoda Jacobiego zastosowana do tej macierzy nie jest zbiezna');
    fprintf('||B|| = %.2f > 1\n', Bnorm);
    prompt = 'Czy chcesz dodac elementy do diagonali? Y/N [Y]: ';
    str = input(prompt,'s');
    if isempty(str)
        str = 'Y';
    end
    
    if(str == 'Y')
        [A, int_coeff] = makedominant(A);
        tytul = strcat(tytul, ' + ', num2str(int_coeff), ' * I');
        figure('Name','Struktura niezerowych elementow macierzy','NumberTitle','off');
        spy(A);
        title(tytul);
    end
end

%%%%%%

prompt = '\nCzy chcesz zoptymalizowac macierz, przetwarzajac ja jako sparse? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end

issparse = 0;
if(str == 'Y')
    issparse = 1;
else
    A = full(A);
end

%%%%%

prompt = '\nDo ilu ograniczyc liczbe iteracji? [1000]: ';
N = input(prompt);
if isempty(N)
    N = 1000;
end

%%%%%

prompt = '\nPrzy jakim bledzie residualnym zakonczyc obliczenia? [0.001]: ';
d = input(prompt);
if isempty(d)
    d = 1e-3;
end

%%%%%

X = jacobi_inverse(A, N, d, tytul, issparse);

%%%%%

prompt = '\nWykonano! Czy chcesz zapisac wynik do pliku? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end

if(str == 'Y')
    save('wynik.mat','A','X')
end

fprintf('\n');

%%%%%

figure('Name','Struktura niezerowych elementow macierzy','NumberTitle','off');
subplot(1,2,1)
spy(A);
title(tytul);

subplot(1,2,2)
spy(X);
tytul2 = strcat('(', tytul, ')^{-1}');
title(tytul2);
end

