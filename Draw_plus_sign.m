function image = Draw_plus_sign(image, xs, ys, colors)
% assert(isa(image, 'uint8'));
assert(length(xs) == length(ys));
num_color = size(colors, 1);
assert(length(xs) == num_color || 1 == num_color);
assert(3 == size(colors, 2));
if (1 == num_color)
	colors = repmat(colors, [length(xs), 1]);
end

[height, width, chn] = size(image);
assert(3 == chn);
num_pix = height * width;

xs = round(xs);
xs(xs > width) = width;
ys = round(ys);
ys(ys > height) = height;
for k = 1:length(xs)
    id = sub2ind([height, width], ys(k), xs(k));
    ids = [id, id+1, id-1, id+height, id-height];
    ids = ids(ids > 0 & ids <= num_pix);
    image(ids) = colors(k, 1);
    image(ids + num_pix) = colors(k, 2);
    image(ids + num_pix * 2) = colors(k, 3);
end
