function num = CountFilesInCurFolder(path, suffix)
if ~exist(path, 'dir')
    error('Directory does not exist: %s', path);
end

files = dir(fullfile(path, strcat('*', suffix)));
num = length(files);