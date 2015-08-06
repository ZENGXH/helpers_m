function CollectAllFiles2OneFolder(root, suffix, path_dst, doMove)
[pathes, files] = GetAllFiles(root, suffix);

for n = 1:length(files)
    if doMove
        if ~strcmp(pathes{n}, root)
            movefile(fullfile(pathes{n}, files{n}), path_dst);
        end
    else
        copyfile(fullfile(pathes{n}, files{n}), path_dst);
    end
end