function flows = Img2Flow_vid(folder_img, range)
num = length(dir(fullfile(folder_img, '*_x.png')));
if (exist(fullfile(folder_img, '0_x.png'), 'file') > 0)
    start = 0;
else
    start = 1;
end

for k = start : start + num - 1
    flow_x = Img2Flow(fullfile(folder_img, sprintf('%s_x.png', k)), range);
    flow_y = Img2Flow(fullfile(folder_img, sprintf('%s_y.png', k)), range);
    assert(1 == size(flow_x, 1) && 1 == size(flow_y, 1));
    if k == start
        flows = zeros([size(flow_x, 1), size(flow_x, 2), 2, num]);
    end
    flows(:,:,1,k - start + 1) = flow_x;
    flows(:,:,2,k - start + 1) = flow_y;
end