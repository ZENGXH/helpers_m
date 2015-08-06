function CheckInputPath(path)
if ~exist(path, 'dir')
    error('Input path %s does not exists!\n', path);
end