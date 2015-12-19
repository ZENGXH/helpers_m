function SaveNDFloat_txt(mat, path_file, do_wh_permute)
fid = fopen(path_file, 'w');
if (fid < 0)
    error('Failed to open %s for writing', path_file);
end

if do_wh_permute
    order = 1:length(size(mat));
    order(1:2) = [2,1];
    mat = permute(mat, order); 
end

fprintf(fid, '%d %d\r\n', size(mat, 1), size(mat,2));
fprintf(fid, '%f ', mat(:));
fclose(fid);
