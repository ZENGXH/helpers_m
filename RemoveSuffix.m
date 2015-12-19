function str = RemoveSuffix(str, pattern)

if nargin < 2
    pattern = '.';
end

assert(ischar(str) || iscell(str));

if iscell(str)
   for n = 1:numel(str)
      str{n} = remove_loc(str{n}, pattern);
   end
else
    str = remove_loc(str, pattern);
end

function str = remove_loc(str, pattern)
pos = strfind(str, pattern);
if ~isempty(pos)
   str = str(1:pos(end)-1); 
end