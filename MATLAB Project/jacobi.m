function [X, it, err, time, mem] = jacobi(A, B, N, d, issparse)
% Rozwiazanie ukladu rownan A*X=B metoda Jacobiego
% d - blad bezwzgledny
tic

% Dekompozycja sparse A (A = D + R)
disp('Sparse decomposing...');
[~, R, I, Dvec] = decompose(A, issparse);
toc

% Odwrotnosc macierzy diagonalnej jako sparse
% https://s-mat-pcs.oulu.fi/~mpa/matreng/eem1_5-3.htm
disp('Inversing diagonal sparse...');
Inv_Dvec = 1 ./ Dvec;
if(issparse == 1)
    Inv_D = spdiags(Inv_Dvec,0,I); % D^(-1) jako sparse (tylko diagonala)
else
    Inv_D = diag(Inv_Dvec); % D^(-1) tez jest macierza diagonalna
end
toc

disp('Counting T,C...');
T = -1 * Inv_D * R;
C = Inv_D * B;
toc

X = C; % przyblizenie poczatkowe
err = Inf(N, 1);
err(1) = countnorm(A * X - B, issparse); % obliczenie normy w zaleznosci od trybu
it = 1;
fprintf('Step: %d, Error: %d\n', it, err(it));
toc

while ((err(it) > d) && (it < N))
    X = T * X + C; % kolejne przyblizenie x
    it = it + 1;
    err(it) = countnorm(A * X - B, issparse);
    fprintf('Step: %d, Error: %d\n', it, err(it));
    toc
end

fprintf('\n');
time = toc;
W = whos;
mem = sum([W.bytes]);
end
