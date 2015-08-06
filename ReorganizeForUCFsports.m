clear,clc
suffix = '.avi';
root = 'D:\Wangjiang\ActionRecognition\Dataset\UCF_sports';

names_class = GetSubFolders(root);
for n = 1:length(names_class)
   path_curclass = fullfile(root, names_class{n});
   CollectAllFiles2OneFolder(path_curclass, suffix, path_curclass, true);
end