function WriteVideo2Imgs(path_vid, folder_img, add_vid_name)
if nargin < 3
    add_vid_name = false;
end
try
    frames = read(VideoReader(path_vid));
catch
    error('Failed to read video %s\n', path_vid);
end
[path, name, ext] = fileparts(path_vid);

if add_vid_name
    for k = 1:size(frames, 4)
        imwrite(frames(:,:,:,k), fullfile(folder_img, sprintf('%s_%d.jpg', name, k)));
    end
else
    for k = 1:size(frames, 4)
        imwrite(frames(:,:,:,k), fullfile(folder_img, sprintf('%d.jpg', k)));
    end
end