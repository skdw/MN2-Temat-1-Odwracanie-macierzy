function no = countnorm(A, issparse)
% Oblicza norme w zaleznosci od trybu (sparse/matrix)

if(issparse == 1)
    no = normest(A);
else
    no = norm(A);
end

end
