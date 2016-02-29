function [d1, d2, d3, d4, d5, d6, d7, d8, d9, d10] = ReadTxtColumes(path_file, strs)
assert(exist(path_file, 'file') > 0);

fid = fopen(path_file, 'r');
assert(fid > 0);

R = textscan(fid, strs);
assert(length(R) <= 10);

for n = 1:length(R)
    eval(sprintf('d%d = R{%d};', n, n));
end

fclose(fid);