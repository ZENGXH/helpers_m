function SampleImages(folder_img, suffix_img, names_vid, labels, num_img_chosen, path_list_file, doshuffle)
num_vid = length(names_vid);
names_all = cell(num_vid, 1);
labels_all = cell(num_vid, 1);

for v = 1:num_vid
    path_imgs = fullfile(folder_img, names_vid{v});
    names_img = GetAllFilesInCurFolder(path_imgs, suffix_img, false);
    ids_chosen = round(linspace(1, length(names_img), num_img_chosen));
    names_all{v} = fullfile(names_vid{v}, strcat(strread(num2str(ids_chosen),'%s'), suffix_img));
    labels_all{v} = repmat(labels(v), num_img_chosen, 1);
end
names_all = cat(1, names_all{:});
labels_all = cat(1, labels_all{:});

if nargin < 5
    doshuffle = false;
end

if doshuffle
    rndIds = randperm(length(names_all));
else
    rndIds = 1:length(names_all);
end

fid = fopen(path_list_file, 'w');
assert(fid > 0);
for n = 1:length(rndIds)
    id = rndIds(n);
    fprintf(fid, '%s %d\n', names_all{id}, labels_all(id));
end
fclose(fid);