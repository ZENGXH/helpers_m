function filenames = GetAllFilesInCurFolder(path, suffix, verbose)
if ~exist(path, 'dir')
    error('Directory does not exist: %s', path);
end

if nargin < 3
    verbose = true;
end

files = dir(fullfile(path, strcat('*', suffix)));
filenames = reshape({files.name}, [], 1);
if verbose
    fprintf('Get %d files\n', length(filenames));
end