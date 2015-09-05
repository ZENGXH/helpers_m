function flow = Img2Flow(path_img, range)
img = imread(path_img);
assert(1 == size(img, 3));

flow = double(img) / 255;
flow = flow * range * 2 - range;