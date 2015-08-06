function draw_cm(mat, tick, doNorm, addPercent)
if size(mat, 1) ~= size(mat, 2) || size(mat, 1) ~= length(tick)
    error('dimension does not match');
end
if nargin < 3
    doNorm = true;
end
if nargin < 4
    addPercent = false;
end
if doNorm
    for n = 1:size(mat,1)
        mat(n,:) = mat(n,:) / sum(mat(n,:));
    end
end

num_class = length(tick);
figure;
imagesc(1:num_class,1:num_class,mat);            %# in color
colormap(flipud(gray));  %# for gray; black for large value.

if addPercent
    textStrings = num2str(mat(:),'%0.2f');
    textStrings = strtrim(cellstr(textStrings));
    [x,y] = meshgrid(1:num_class);
    hStrings = text(x(:),y(:),textStrings(:), 'HorizontalAlignment','center');
    midValue = mean(get(gca,'CLim'));
    textColors = repmat(mat(:) > midValue,1,3);
    set(hStrings,{'Color'},num2cell(textColors,2));  %# Change the text colors
end

set(gca, 'YTick', 1:num_class);
set(gca,'yticklabel',tick);
%change '_' to '\_' for rotation
for n = 1:length(tick)
    tick{n} = strrep(tick{n}, '_', '\_');
end

% set(gca,'xticklabel',tick,'XAxisLocation','top');
% rotateXLabels(gca, 270 );% rotate the x tick
% set(gca, 'XTick', 1:num_class);

set(gca, 'XTick', []);
for n = 1:length(tick)
    text(n, length(tick)+0.8, tick{n}, 'rotation', -90);
end
colormap jet
set(gca, 'outerposition', [0.08,0.15,0.8,0.8])