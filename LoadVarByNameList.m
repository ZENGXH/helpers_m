function varList = LoadVarByNameList(matPath, varNameList)
assert(ischar(matPath));
assert(iscell(varNameList));
str = 'load(matPath';

num = length(varNameList);
for n = 1:num
   str = sprintf('%s, ''%s''', str, varNameList{n});
end
str = strcat(str, ')');
eval(str); %do loading

varList = cell(num, 1);
for n = 1:num
    eval( sprintf( 'varList{n} = %s;', varNameList{n} ) );
end