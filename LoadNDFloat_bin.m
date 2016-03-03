function mat = LoadNDFloat_bin(path_file, ndim, do_wh_permute, do_dim_reverse)
if nargin < 4
    do_dim_reverse = false;
end

fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end
siz = fread(fid, ndim, 'int');
mat = fread(fid, prod(siz), 'float');
fclose(fid);

if length(siz) == 1
    siz = [1, siz];
end
if do_dim_reverse
	siz = siz(end:-1:1); %original order: num, chn, height, width
end

mat = reshape(mat, reshape(siz, 1, []));
if do_wh_permute
    order = 1:length(siz);
    order(1:2) = [2,1];
    mat = permute(mat, order);
end
