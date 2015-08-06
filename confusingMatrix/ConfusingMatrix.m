function confMatrix = ConfusingMatrix(predLabel, gtLabels)
if length(predLabel) ~= length(gtLabels)
    error('length of predict label and gt label do not match');
end

ids_class = unique(gtLabels);
num_class = length(ids_class);
confMatrix = zeros(num_class, num_class);

for cls_i = 1:num_class
    smpIdInCurClass = find(gtLabels == ids_class(cls_i));
    smpNumInCurClass = length(smpIdInCurClass);
   
    %TODO: can use histc (compare  speed)
    for cls_j = 1:num_class
        i2jNum = sum(predLabel(smpIdInCurClass) == ids_class(cls_j));
        confMatrix(cls_i, cls_j) = i2jNum;
    end
   
    if sum(confMatrix(cls_i, :)) ~= smpNumInCurClass
        error('sample number does not match');
    end
   
%     confMatrix_normed(cls_i, :) = confMatrix_ori(cls_i, :) / smpNumInCurClass;
end