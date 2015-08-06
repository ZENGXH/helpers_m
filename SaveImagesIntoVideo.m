function SaveImagesIntoVideo(visualVidPath, images, frameRate)
vWriter = VideoWriter(visualVidPath);
vWriter.FrameRate = frameRate;
open(vWriter);
len = size(images, 4);
for n = 1:len
    writeVideo(vWriter, images(:,:,:,n));
end
close(vWriter);