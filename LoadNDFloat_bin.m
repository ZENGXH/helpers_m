function mat = LoadNDFloat_bin(path_file, ndim, do_wh_permute)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

siz = fread(fid, ndim, 'int');
mat = fread(fid, prod(siz), 'float');
fclose(fid);

if length(siz) == 1
    siz = [siz, 1];
end
mat = reshape(mat, reshape(siz, 1, []));
if do_wh_permute
    order = 1:length(siz);
    order(1:2) = [2,1];
    mat = permute(mat, order);
end