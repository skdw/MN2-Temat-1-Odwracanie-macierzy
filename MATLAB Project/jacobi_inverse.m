function X = jacobi_inverse(A, N, d, tytul, issparse)
% Odwracanie macierzy A metoda Jacobiego

if(issparse == 1)
    I = speye(size(A));
else
    I = eye(size(A));
end

[X, it, err, time, mem] = jacobi(A, I, N, d, issparse);

fprintf('Liczba wykonanych przyblizen: %d\n', it);
fprintf('Blad koncowy: %d\n', err(it));
fprintf('Czas wykonania: %d sekund\n', time);
fprintf('Uzycie pamieci: %d bajtow\n', mem);

Y = err(1:it);
figure('Name','Zbieznosc metody Jacobiego','NumberTitle','off');
plot(1:it,Y);
title(tytul);
xlabel('Liczba iteracji');
ylabel('Blad residualny');
end

