function data = LoadVarByName_multi(path, name_fea, names_vid, ids_vol)
num_vid = length(names_vid);

if isempty(ids_vol)
    v = 1;
    data1 = reshape(LoadVarByName(fullfile(path, strcat(names_vid{v}(1:end-4), '.mat')), name_fea), [], 1);
    dim = size(data1, 1);
    data = zeros(dim, num_vid);
    parfor v = 1:num_vid
        data(:,v) = reshape(LoadVarByName(fullfile(path, strcat(names_vid{v}(1:end-4), '.mat')), name_fea), [], 1);
    end
else
    v = 1;
    rep_allvol = LoadVarByName(fullfile(path, strcat(names_vid{v}(1:end-4), '.mat')), name_fea);
    data1 = reshape(rep_allvol(:, ids_vol), [], 1);
    dim = size(data1, 1);
    
    data = zeros(dim, num_vid);
    parfor v = 1:num_vid
        rep_allvol = LoadVarByName(fullfile(path, strcat(names_vid{v}(1:end-4), '.mat')), name_fea);
        data(:,v) = reshape(rep_allvol(:, ids_vol), [], 1);
    end
end