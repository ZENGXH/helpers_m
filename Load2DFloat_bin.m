function mat = Load2DFloat_bin(path_file)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

siz = fread(fid, 2, 'int');
rows = siz(1); cols = siz(2);
mat = fread(fid, rows * cols, 'float');
mat = reshape(mat, [rows, cols]);
fclose(fid);