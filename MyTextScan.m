function results = MyTextScan(path_file, format_str)
fid = fopen(path_file, 'r');
assert(fid > 0);

results = textscan(fid, format_str);

fclose(fid);