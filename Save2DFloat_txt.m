function Save2DFloat_txt(mat, path_file)
fid = fopen(path_file, 'w');
if (fid < 0)
    error('Failed to open %s for writing', path_file);
end

assert(size(mat, 3) == 1);
[rows, cols] = size(mat);
fprintf(fid, '%d %d\r\n', [rows, cols]);
fprintf(fid, '%f ', mat(:));
fclose(fid);