function [frames, names_img] = ReadVideoFromImgs(path_images, suffix)

files = dir(fullfile(path_images, strcat('*', suffix)));
names_img = {files.name};
frameNum = length(names_img);
if frameNum < 1
   warning('No *%s files are found in %s\n', suffix, path_images);
   frames = [];
   return;
end

img = imread(fullfile(path_images, names_img{1}));
frames = zeros([size(img, 1), size(img, 2), size(img, 3), frameNum], 'uint8');
frames(:,:,:,1) = img;

for n = 2:frameNum
    frames(:,:,:,n) = imread(fullfile(path_images, names_img{n}));
end