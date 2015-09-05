function optImgs = VisualizeOptFlowMag_video(optFlows, maxMag)
assert(size(optFlows, 3) == 2);

mags = optFlows(:,:,1,:).^2 +optFlows(:,:,2,:).^2;
if nargin > 1
    maxMag = min(maxMag, sqrt(max(mags(:)))+eps);
end

optImgs = uint8(mags / maxMag * 255);
% optImgs = repmat(mags, [1, 1, 1, 3]);