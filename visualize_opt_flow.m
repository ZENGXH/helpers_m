
%load flow
folder_flow = 'F:\Data\optflow\ucf_sports_lc_forward\013';
flows = Img2Flow_3chn(folder_flow);
%do visualization
flowImgs = VisualizeOptFlow_video(flows, 10);
%save
folder_vis = folder_flow;
for k = 1:size(flowImgs, 4)
    imwrite(flowImgs(:,:,:,k), fullfile(folder_vis, sprintf('%d_vis.png', k)));
end