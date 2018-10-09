function str = makelink(filenames, i)
% Tworzy lacze do i-tego znalezionego pliku

formatSpec = '<a href="matlab:[A, X]=sparsefile(''Sparses/%s'');">%s</a>';
str = compose(formatSpec, filenames{i}, filenames{i});

end

