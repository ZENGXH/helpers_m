clear,clc
addpath(genpath('E:\Tools\piotr_toolbox\toolbox'));

SRC = 'E:\Data\OlympicSports';
[pathes, filenames] = GetAllFiles(SRC, '.seq');

for k = 1:length(filenames)
    name_seq = filenames{k};
    name_avi = strcat(name_seq(1:end-4), '.avi');
    fName = fullfile(pathes{k}, name_avi);
    frames = seqIo(fName, 'toImgs');
    SaveImagesIntoVideo(fullfile(pathes{k}, name_avi), frames, 30);
end
