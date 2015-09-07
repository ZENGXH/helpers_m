clear,clc
addpath('..\');
addpath(genpath('..\toolbox_piotr\'));
dataset = 'JHMDB';
root_vid = fullfile('F:\Datasets', strcat(dataset, '_img'));
suffix_img = '.jpg';
root_edge = fullfile('F:\Data\edges_structure', dataset); CheckOutputPath(root_edge);
videos = GetSubFolders(root_vid);

%load edge model
model=load('models/forest/modelBsds'); model=model.model;
model.opts.multiscale=0;
model.opts.sharpen=2;
model.opts.nThreads=4;

model.opts.nms=0;
parfor v = 1:length(videos)
    path_vid = fullfile(root_vid, videos{v});
    [frames, names_img] = ReadVideoFromImgs(path_vid, suffix_img);
    
    path_edge = fullfile(root_edge, videos{v});
    mkdir(path_edge);
    
    for f = 1:size(frames, 4)
        [E,O]=edgesDetect(frames(:,:,:,f),model);
        E=edgesNmsMex(E,O,2,0,1,model.opts.nThreads);
%         SaveVarList(fullfile(path_edge, ...
%             strcat(names_img{f}(1:end-length(suffix_img)), '.mat')), {E; O}, {'E'; 'O'});
        path_E = fullfile(path_edge, strcat(names_img{f}(1:end-length(suffix_img)), '_E.bin'));
        Save2DFloat_bin(E, path_E);
        path_O = fullfile(path_edge, strcat(names_img{f}(1:end-length(suffix_img)), '_O.bin'));
        Save2DFloat_bin(O, path_O);
    end
end