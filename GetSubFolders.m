function folders = GetSubFolders(root)
folders = dir(fullfile(root));
folders = folders([folders.isdir]);
folders = {folders.name};
folders(ismember(folders, {'.', '..'})) = [];