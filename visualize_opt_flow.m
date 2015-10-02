clear,clc
root_flow = '/data1/data/ucf101_flow_tvl1_340_256';
root_vis = '/data1/data/visual_flow/ucf101_flow_tvl1_340_256';
suffix_flow = '.png';
range_flow = 15;
maxMag = 5;

videos = GetSubFolders(root_flow);
% videos = videos(1:130:end);
if matlabpool('size') <= 0
    matlabpool
end
parfor v = 1:length(videos)
    fprintf('%d\n', v);
    %load flow
    folder_flow = fullfile(root_flow, videos{v});
    folder_vis = fullfile(root_vis, videos{v});
    if ~exist(folder_vis, 'dir'), mkdir(folder_vis), end
    num_frame = CountFilesInCurFolder(folder_flow, suffix_flow) / 2;
    
    for n = 1:num_frame
        flow_x = Img2Flow(fullfile(folder_flow, sprintf('%d_x%s', n-1, suffix_flow)), range_flow);
        flow_y = Img2Flow(fullfile(folder_flow, sprintf('%d_y%s', n-1, suffix_flow)), range_flow);
        visImg = VisualizeOpticalFlow_WJ(flow_x, flow_y, maxMag);
        imwrite(visImg, fullfile(folder_vis, sprintf('%d_vis.png', n-1)));        
    end
end

% %load flow
% folder_flow = 'F:\Data\optflow\ucf_sports_lc_forward\013';
% flows = Img2Flow_3chn(folder_flow);
% %do visualization
% flowImgs = VisualizeOptFlow_video(flows, 10);
% %save
% folder_vis = folder_flow;
% for k = 1:size(flowImgs, 4)
%     imwrite(flowImgs(:,:,:,k), fullfile(folder_vis, sprintf('%d_vis.png', k)));
% end