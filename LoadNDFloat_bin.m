function mat = LoadNDFloat_bin(path_file, ndim)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

siz = fread(fid, ndim, 'int');
mat = fread(fid, prod(siz), 'float');
mat = reshape(mat, siz);
fclose(fid);