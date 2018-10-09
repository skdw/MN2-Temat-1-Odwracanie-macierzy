function filelinks = findfiles()
% Szuka zapisanych plikow .mat i umo¿liwia zaladowanie wybranego z nich

listing = dir('Sparses/*.mat');
filenames = {listing.name};

stri = cell(size(filenames));
for i = 1:size(filenames,2)
    stri{1,i} = makelink(filenames, i);
end

if(isempty(stri) == 0)
    filelinks = [stri{1,:}];
else
    filelinks = {};
end

end

