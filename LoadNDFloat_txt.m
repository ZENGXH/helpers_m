function mat = LoadNDFloat_txt(path_file, ndim, do_wh_permute)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

siz = fscanf(fid, '%d', ndim);
[mat, cnt] = fscanf(fid, '%f');
fclose(fid);
assert(prod(siz) == cnt);

if length(siz) == 1
    siz = [siz, 1];
end
mat = reshape(mat, reshape(siz, 1, []));
if do_wh_permute
    order = 1:length(siz);
    order(1:2) = [2,1];
    mat = permute(mat, order);
end