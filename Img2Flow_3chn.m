function optFlows = Img2Flow_3chn(foldPath)

files_x = dir(fullfile(foldPath, '*_x.png'));
len = length(files_x);
files_y = dir(fullfile(foldPath, '*_y.png'));
assert(length(files_y) == len);
% assert(len > 0);
if 0 == len
   optFlows = [];
   return;
end

%get image height, width
info = imfinfo(fullfile(foldPath, files_x(1).name));
width = info.Width;
height = info.Height;
optFlows = zeros(height, width, 2, len, 'single');

for k = 1:len
   optImg = double( imread(fullfile(foldPath, sprintf('%d_x.png', k))) );
   [hei, wid, nChn] = size(optImg); assert(3 == nChn && hei == height && wid == width);   
   integer = optImg(:,:,1);
   frac1 = optImg(:,:,2);
   frac2 = optImg(:,:,3);
   optFlows(:,:,1,k) = single(integer + frac1 / 100 + frac2 / 1e4 - 128);
   
   optImg = double( imread(fullfile(foldPath, sprintf('%d_y.png', k))) );
   [hei, wid, nChn] = size(optImg); assert(3 == nChn && hei == height && wid == width);   
   integer = optImg(:,:,1);
   frac1 = optImg(:,:,2);
   frac2 = optImg(:,:,3);
   optFlows(:,:,2,k) = single(integer + frac1 / 100 + frac2 / 1e4 - 128);
end