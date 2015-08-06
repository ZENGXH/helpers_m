% clear,clc

SRC = '\\msra-vc3d-02\ActionRecognition\CodeBooks\JHMDB_DTF';
DST = SRC;%'\\msra-vc3d-02\ActionRecognition\Representations\JHMDB_DTF_LSAC_2';
CheckOutputPath(DST);

names_fea = {'trajShape_ori'; 'hog'; 'hof'; 'mbhx'; 'mbhy'};

files = dir(fullfile(SRC, sprintf('trainData_%s.mat', names_fea{1})));
parfor k = 1:length(files)
    name = files(k).name;
    num_fea = length(names_fea);
    
    reps = cell(num_fea, 1);
    for n = 1:num_fea
        filePath = fullfile(SRC, strrep(name, strcat(names_fea{1}, '.mat'), strcat(names_fea{n}, '.mat')));
%         reps{n} = LoadVarByName(filePath, 'representation');
        reps{n} = LoadVarByName(filePath, names_fea{n});
    end
    
    %     newFilePath = fullfile(DST, strrep(name, strcat('_', names_fea{1}, '.mat'), '.mat'));
    newFilePath = fullfile(DST, 'TrainData.mat');
    SaveVarList(newFilePath, reps, names_fea);
end