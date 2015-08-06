clear,clc

root = '\\MSRA-VC3D-01\ActionRecognition\Dataset\UCF11';
names_class = GetSubFolders(root);
suffix = '.mpg';

for n = 1:length(names_class)
    path_curclass = fullfile(root, names_class{n});
    CollectAllFiles2OneFolder(path_curclass, suffix, path_curclass, true);
end

DeleteAllEmptyFolders(root)