function PrintfVecs(path_file, varargin)
assert(nargin >= 2);

fid = fopen(path_file, 'w');
assert(fid > 0);

str = '';
len = zeros(nargin - 1, 1);
for n = 1:nargin-1
   tmp = varargin{n};
   assert(isvector(tmp));
   if iscell(tmp)
       assert(ischar(tmp{1}));
       str = [str, '_s'];
   elseif isinteger(tmp)
       str = [str, '_d'];
   elseif isfloat(tmp)
       str = [str, '_f'];
   else
      error('not supported type for %d-th variable argument', n); 
   end
   len(n) = numel(tmp);
end
len = unique(len);
assert(isscalar(len));

name_func = ['Printf', str];
eval(sprintf('%s(fid, varargin{1}, varargin{2});', name_func));

fclose(fid);

function Printf_s_d(fid, str, int)
for k = 1:numel(str)
   fprintf(fid, '%s %d\r\n', str{k}, int(k));
end