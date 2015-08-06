function frames = ReadVideoFromImgs(path_images, suffix)

files = dir(fullfile(path_images, strcat('*', suffix)));
frameNum = length(files);
if frameNum < 1
   warning('No *%s files are found in %s\n', suffix, path_images);
   frames = [];
   return;
end

img = imread(fullfile(path_images, files(1).name));
frames = zeros([size(img), frameNum], 'uint8');
frames(:,:,:,1) = img;

for n = 2:frameNum
    frames(:,:,:,n) = imread(fullfile(path_images, files(n).name));
end