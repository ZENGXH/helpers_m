function img = DrawBBoxesOnImg(img, bbox, colors, linewidth)

%bbox is N * 4 matrix, each row correspond to [left, top, width, height]

%colors is K * 3 matrix, each row is a color

assert(size(bbox, 2) == 4);

assert(size(colors, 2)==  3);

num_color = size(colors, 1);

if nargin < 4
    linewidth = 1;
end

for n = 1:size(bbox, 1)

    img = DrawBBoxOnImg(img, bbox(n,:), colors(mod(n-1, num_color)+1, :), linewidth);

end
