function res = ScanfVecs(path_file, str, ids)
fid = fopen(path_file, 'r');
assert(fid > 0);

R = textscan(fid, str);
res = R(ids);

fclose(fid);