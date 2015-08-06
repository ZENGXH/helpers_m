function SaveVar(matFilePath, var, name)
%assign var to new-name vars

eval( sprintf('%s = var;', name) );
eval( sprintf('save(matFilePath, ''%s'', ''-v7.3'');', name) );