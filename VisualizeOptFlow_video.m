function optImgs = VisualizeOptFlow_video(optFlows, maxMag)
[height, width, nChn, len] = size(optFlows);
assert(nChn == 2);
optImgs = zeros(height, width, 3, len, 'uint8');
if nargin > 1
    mags = optFlows(:,:,1,:).^2 +optFlows(:,:,2,:).^2;    
    maxMag = min(maxMag, sqrt(max(mags(:)))+eps);

    for k = 1:len
        optImgs(:,:,:,k) = VisualizeOpticalFlow_WJ(optFlows(:,:,1,k), optFlows(:,:,2,k), maxMag);
    end
else
    for k = 1:len
        optImgs(:,:,:,k) = VisualizeOpticalFlow_WJ(optFlows(:,:,1,k), optFlows(:,:,2,k));
    end
end