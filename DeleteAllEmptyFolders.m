function DeleteAllEmptyFolders(root)
pathes = GetAllFolders(root);
for n = length(pathes):-1:2
   if length(dir(pathes{n})) < 3
       rmdir(pathes{n});
   end
end