function DeleteAllFilesUsingSuffix(root, suffix)
pathes_all = GetAllFolders(root);
for n = length(pathes_all):-1:1 %first delete deeper folders
   path_curFold = pathes_all{n};
   
   delete(fullfile(path_curFold, strcat('*', suffix)));
   if IsEmptyFolder(path_curFold)
       rmdir(path_curFold);
   end
end