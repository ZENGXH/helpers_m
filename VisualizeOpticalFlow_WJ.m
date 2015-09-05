function flowImg = VisualizeOpticalFlow_WJ(dx, dy, globalMaxMag)
if any(isnan(dx(:))) || any(isnan(dy(:)))
    error('there exists NaN in optical flow vectors');
end

mag = sqrt(dx.^2 + dy.^2);
dx = dx ./ (mag+eps);
dy = dy ./ (mag+eps);

theta = atan2(-dy, -dx)/pi; %range from -1 to 1
theta = (theta + 1) / 2; %mapped to [0 1]

H = theta;
if nargin <3
    globalMaxMag = max(mag(:)) + eps;
end
S = mag / globalMaxMag;
V = ones(size(H));

flowImg = im2uint8(hsv2rgb(cat(3, H, S, V)));