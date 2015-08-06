function [pathes, filenames] = GetAllFiles(ROOT, suffix)
filenames = cell(0, 1);
pathes = cell(0, 1);

if ~exist(ROOT, 'dir')
    warning('Directory does not exist: %s', ROOT);
    return;
end

FOLDS = GetAllFolders(ROOT);
for n = 1:length(FOLDS)
    files = dir(fullfile(FOLDS{n}, strcat('*', suffix)));
    num = length(files);
    filenames(end+1:end+num) = {files.name};
    pathes(end+1:end+num) = FOLDS(n);
end

if length(pathes) ~= length(filenames)
    error('Path and file name length do not match');
end
fprintf('Get %d folds, %d files\n', length(FOLDS), length(filenames));