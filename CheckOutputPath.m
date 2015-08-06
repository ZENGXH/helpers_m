function CheckOutputPath(path)
if ~exist(path, 'dir')
    fprintf('%s does not exist, we create it\n', path);
    if ~mkdir(path)
        error('Failed to create folder: %s\n', path);
    end
end