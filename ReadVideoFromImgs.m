function frames = ReadVideoFromImgs(folder_img, suffix_img)

num_frame = CountFilesInCurFolder(folder_img, suffix_img);
if 0 == num_frame
   error('no files with suffix %s are found', suffix_img);
end

[img, colmp] = imread(fullfile(folder_img, sprintf('%d%s', 0, suffix_img)));
frames = zeros([size(img, 1), size(img, 2), size(img, 3), num_frame], 'uint8');

if isempty(colmp) %rgb image
    frames(:,:,:,1) = img;
    for n = 2:num_frame
        frames(:,:,:,n) = imread(fullfile(folder_img, sprintf('%d%s', n-1, suffix_img))) ;
    end
else %label image
    frames(:,:,:,1) = uint8(255*ind2rgb(img, colmp ));
    for n = 2:num_frame
        [img, colmp] = imread(fullfile(folder_img, sprintf('%d%s', n-1, suffix_img)));
        frames(:,:,:,n) = uint8(255*ind2rgb(img, colmp ));
    end
end