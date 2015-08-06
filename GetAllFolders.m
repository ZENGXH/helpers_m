function FOLDS = GetAllFolders(SRCROOT)
if ~exist(SRCROOT, 'dir')
    error('Directory does not exist: %s', SRCROOT);
end

FOLDS{1} = SRCROOT;
pos = 1;
while pos <= length(FOLDS)
    curFold = FOLDS{pos};
    subFolds = GetSubFolders(curFold);
    if  verLessThan('matlab', '8.1.0')
        for k = 1:length(subFolds)
            FOLDS{end+1}= fullfile(curFold, subFolds{k});
        end
    else
        FOLDS(end+1:end+length(subFolds)) = fullfile(curFold, subFolds);
    end
    pos = pos + 1;
end
