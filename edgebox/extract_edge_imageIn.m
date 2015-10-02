clear,clc
addpath('../');
addpath(genpath('../toolbox_piotr'));
addpath('private')
% dataset = 'JHMDB';
% root_vid = fullfile('F:\Datasets', strcat(dataset, '_img'));
root_vid = '/data1/data/visual_flow/ucf101_flow_tvl1_340_256';
suffix_img = '_vis.png';
% root_edge = fullfile('F:\Data\edges_structure', dataset); CheckOutputPath(root_edge);
root_edge = '/data1/data/edge_structure/ucf101_flow_tvl1_340_256'; CheckOutputPath(root_edge);
videos = GetSubFolders(root_vid);
% videos = videos(1:130:end);

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
    folder_vid = fullfile(root_vid, videos{v});    
    folder_edge = fullfile(root_edge, videos{v});
    if ~exist(folder_edge, 'dir'), mkdir(folder_edge), end;
    
    num_frame = CountFilesInCurFolder(folder_vid, suffix_img);
    for f = 1:num_frame
        img = imread(fullfile(folder_vid, sprintf('%d%s', f-1, suffix_img)));        
        [E,O]=edgesDetect(img, model);
        E=edgesNmsMex(E,O,2,0,1,model.opts.nThreads);
%         SaveVarList(fullfile(path_edge, ...
%             strcat(names_img{f}(1:end-length(suffix_img)), '.mat')), {E; O}, {'E'; 'O'});
        path_E = fullfile(folder_edge, sprintf('%d_E.bin', f-1));
        SaveNDFloat_bin(E, path_E, false);
        path_O = fullfile(folder_edge, sprintf('%d_O.bin', f-1));
        SaveNDFloat_bin(O, path_O, false);
    end
end