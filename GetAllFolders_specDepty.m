function folders = GetAllFolders_specDepty(root, depth)
if ~exist(root, 'dir')
    error('Directory does not exist: %s', root);
end

assert(depth >= 1);
folders = cell(depth, 1);
folders{1} = strcat( root, '\', GetSubFolders(root));

for n = 2:depth
    tmp = cell(length(folders{n-1}), 1);
    for k = 1:length(tmp)
       tmp{k} = strcat( folders{n-1}{k}, '\', GetSubFolders(folders{n-1}{k}));
    end
    tmp = cat(2, tmp{:});
    folders{n} = tmp;
end

folders = folders{depth};