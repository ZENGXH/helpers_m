function accus_perclass = AnalysisConfusingMatrix(CM, names_class)
%% show confusing matrix
draw_cm(CM, names_class);

%% Show per-class accuracy bars
CM = bsxfun(@times, CM, 1 ./ sum(CM, 2));
num_class = size(CM, 1);
accus_perclass = CM(1:num_class+1:end);

figure, bar(accus_perclass); grid on;
% set(gca, 'XTickLabel',names_class, 'XTick',1:num_class);
% rotateXLabels(gca, 315 );
set(gca, 'XTick', []);
for n = 1:length(names_class)
    text(n, -0.01, names_class{n}, 'rotation', -90);
end


%% Show high mis-classification cases
CM1 = CM;
CM1(1:num_class+1:end) = 0; %set diagonal to 0
[~, stIds] = sort(CM1(:), 'descend');
[ids_src, ids_dst] = ind2sub([num_class, num_class], stIds);

num_show = 20;
stIds = stIds(1:num_show);
stIds_r = sub2ind([num_class, num_class], ids_dst(1:num_show), ids_src(1:num_show));
stIds = union(stIds, stIds_r);
[ids_src, ids_dst] = ind2sub([num_class, num_class], stIds);

fprintf('High mis-classification categories:\n');
for n = 1:length(ids_src)
    s = ids_src(n);
    d = ids_dst(n);
    if s < d
        fprintf('%s --> %s (%.4f)\n', names_class{s}, names_class{d}, CM1(s, d));
        fprintf('%s --> %s (%.4f)\n\n', names_class{d}, names_class{s}, CM1(d, s));
    end
end