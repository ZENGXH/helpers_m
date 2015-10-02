function SaveNDFloat_bin(mat, path_file, do_wh_permute)
fid = fopen(path_file, 'w');
if (fid < 0)
    error('Failed to open %s for writing', path_file);
end

if do_wh_permute
    order = 1:length(size(mat));
    order(1:2) = [2,1];
    mat = permute(mat, order); 
end

fwrite(fid, size(mat), 'int');
fwrite(fid, mat, 'float');
fclose(fid);