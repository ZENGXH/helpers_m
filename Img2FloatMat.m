function mat = Img2FloatMat(path_img, low, high)
%mapping image from [0, 255] to float matrix ranges in [low, high]
assert(high > low);
mat = double(imread(path_img)) / 255; %mapped to [0,1]
mat = mat * (high - low) + low;