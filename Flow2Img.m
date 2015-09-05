function Flow2Img(flow, range, path_img)
assert(1 == size(flow, 3));

flow = (flow + range) / (range * 2);
flow(flow > 1) = 1;
flow(flow < 0) = 0;
flow = uint8(flow * 255);
imwrite(flow, path_img);