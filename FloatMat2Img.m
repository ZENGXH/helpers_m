function FloatMat2Img(mat, low, high, path_img)
%mapping float matrix ranges in [low, high] to [0, 255]
siz = size(mat);
ndim = length(siz);
assert(ndim <= 3);
if 3 == ndim
    assert(siz(3) == 3); %only 3-channel image are supported
end

assert(high > low);
mat = (mat - low) / (high - low); %convert to [0,1]
mat = uint8(mat * 255);

imwrite(mat, path_img);