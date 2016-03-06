function [mat, shape] = LoadBinFile(path_file)
fid = fopen(path_file, 'r');
if (fid < 0)
    error('Failed to open %s for reading', path_file);
end

shape = fread(fid, 4, 'int'); %num, chn, height, width
mat = fread(fid, prod(shape), 'float');

fclose(fid);

mat = reshape(mat, shape(end:-1:1)');
mat = squeeze(mat);