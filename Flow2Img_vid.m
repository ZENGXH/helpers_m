function Flow2Img_vid(flows, range, folder_img)
assert(2 == size(flows, 3));

for k = 1:size(flows, 4)
   Flow2Img(flows(:,:,1,k), range, fullfile(folder_img, sprintf('%d_x.png', k-1)));
   Flow2Img(flows(:,:,2,k), range, fullfile(folder_img, sprintf('%d_y.png', k-1)));
end

