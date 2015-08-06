clear,clc

ROOT = 'E:\Data\UCF_sports';
names_class = GetSubFolders(ROOT);
suffix_img = '.jpg';
len_figure = 1;

for cls = 1:length(names_class)
    folders_vid = GetSubFolders(fullfile(ROOT, names_class{cls}));
    
    for vid = 1:length(folders_vid)
        vid,
        folder_curvid = fullfile(ROOT, names_class{cls}, folders_vid{vid});
        [frames, imgName_1st] = LoadFrameFromImgs(folder_curvid, suffix_img, len_figure);
        if isempty(frames)
            continue;
        end
        
        path_vid = fullfile(folder_curvid, strcat(imgName_1st(1:end-length(suffix_img)), '.avi'));
        SaveImagesIntoVideo(path_vid, frames, 10);
    end
end