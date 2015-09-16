function mat = LoadNDFloat_bin(path_file, ndim, do_wh_switch)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

siz = fread(fid, ndim, 'int');
mat = fread(fid, prod(siz), 'float');
if do_wh_switch
    tmp = siz(1);
    siz(1) = siz(2);
    siz(2) = tmp;
end
mat = reshape(mat, reshape(siz, 1, []));
fclose(fid);