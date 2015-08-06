function var = LoadVarByName(matPath, varName)
assert(ischar(varName));
assert(exist(matPath, 'file') > 0);
load(matPath, varName);
if exist(varName, 'var')
    eval( sprintf( 'var = %s;', varName ) );
else
    var = [];
end