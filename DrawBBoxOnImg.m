function img = DrawBBoxOnImg(img, bb, color, linewidth)
% bb format: [left, top, width, height]

if nargin < 4
    linewidth = 1;
end

[height, width, chns] = size(img);

assert(3 == chns);

l = bb(1); t = bb(2); r = bb(3) + bb(1); b = bb(4) + bb(2);
l = round(l);
r = round(r);
t = round(t);
b = round(b);

if (l > r || t > b)
    warning('Invalid bbox input');
    return;
end

l1 = max(1, l);
t1 = max(1, t);
r1 = min(width, r);
b1 = min(height, b);

% if any(bb ~= [l1, t1, r1, b1])
%     warning('bbox stride out image plane') ;
% end

halfwidth1 = floor(linewidth/2);
halfwidth2 = ceil(linewidth/2);

for ch = 1:3
    %top
    if t > 0
        img(t1-halfwidth1 : t1+halfwidth2-1, l1:r1, ch) = color(ch);
    end   

    %bottom
    if b <= height
        img(b1-halfwidth1 : b1+halfwidth2-1, l1:r1, ch) = color(ch);
    end   

    %left
    if l > 0
       img(t1:b1, l1-halfwidth1 : l1+halfwidth2-1, ch) = color(ch);
    end   

    %right
    if r <= width
       img(t1:b1, r1-halfwidth1 : r1+halfwidth2-1, ch) = color(ch);
    end

end
