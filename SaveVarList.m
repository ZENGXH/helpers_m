function SaveVarList(matFilePath, varList, varNameList)
assert(iscell(varList) && iscell(varNameList));
num = length(varList);
%assert(length(varNameList) == num);
if length(varNameList) ~= num
    disp(varNameList);
    size(varList)
end    
    
%assign var to new-name vars
for k = 1:num
    eval( sprintf('%s = varList{k};', varNameList{k}) );   
end
%save using string
str = sprintf(' ''%s'' ', varNameList{1});
for k = 2:num
   str = sprintf('%s, ''%s'' ', str, varNameList{k}); 
end
eval( sprintf('save(matFilePath, %s, ''-v7.3'');', str) );