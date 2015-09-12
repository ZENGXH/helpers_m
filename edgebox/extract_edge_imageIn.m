clear,clc
addpath('..\');
addpath(genpath('..\toolbox_piotr\'));
dataset = 'JHMDB';
% root_vid = fullfile('F:\Datasets', strcat(dataset, '_img'));
root_vid = 'F:\Data\smap\JHMDB_flow_lc_sigma_2_maxMag_15_clip1.0';
suffix_img = '.png';
% root_edge = fullfile('F:\Data\edges_structure', dataset); CheckOutputPath(root_edge);
root_edge = fullfile('F:\Data\edges_structure', 'JHMDB_flow_lc_sigma_2_maxMag_15_clip1.0'); CheckOutputPath(root_edge);
videos = GetSubFolders(root_vid);

%load edge model
model=load('models/forest/modelBsds'); model=model.model;
model.opts.multiscale=0;
model.opts.sharpen=2;
model.opts.nThreads=4;

model.opts.nms=0;
if matlabpool('size') <= 0
    matlabpool
end
parfor v = 1:length(videos)
    path_vid = fullfile(root_vid, videos{v});
    [frames, names_img] = ReadVideoFromImgs(path_vid, suffix_img);
    [height, width, chn, num] = size(frames);
    if chn == 1
        frames = reshape(frames, [], size(frames, 4));        
        frames = repmat(frames, [3, 1]);
        frames = reshape(frames, height, width, 3, num);
    end
    
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