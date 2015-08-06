function CheckFileExists(filePath)
if ~exist(filePath, 'file')
    error('%s does not exists', filePath);
end