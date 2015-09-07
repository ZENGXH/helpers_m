function Save2DFloat_bin(mat, path_file)
fid = fopen(path_file, 'w');
if (fid < 0)
    error('Failed to open %s for writing', path_file);
end

assert(size(mat, 3) == 1);
[rows, cols] = size(mat);
fwrite(fid, [rows, cols], 'int');
fwrite(fid, mat, 'float');
fclose(fid);