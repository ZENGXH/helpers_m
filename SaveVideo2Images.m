clear,clc

SRC = 'Z:\SMaps\JHMDB_bdCon2D_minuseMin';
DST = 'E:\ImageClassification\Data\JHMDB_saliency';
CheckOutputPath(DST);

doExt = true;

[pathes, filenames] = GetAllFiles(SRC, '.avi');
for n = 1:length(filenames)
    name_vid = filenames{n};
    path_vid = fullfile(pathes{n}, name_vid);
    
    frames = read(VideoReader(path_vid));
    
    path_img = fullfile( strrep(pathes{n}, SRC, DST), name_vid(1:end-4) );
    mkdir(path_img);
    for l = 1:size(frames, 4)
        imwrite(frames(:,:,:,l), fullfile(path_img, sprintf('%d.jpg', l)));
    end
    
    if doExt
        imwrite(frames(:,:,:,end), fullfile(path_img, sprintf('%d.jpg', size(frames, 4)+1)));
    end
end