clear,clc

load('F:\Data\edges_structure\ucf_sports\020\7603-4_70171.mat', 'E', 'O');

o = edgeBoxes();
o.kappa = 1;
bbs=edgeBoxesMex(E,O,o.alpha,o.beta,o.eta,o.minScore,o.maxBoxes,...
    o.edgeMinMag,o.edgeMergeThr,o.clusterMinMag,...
    o.maxAspectRatio,o.minBoxArea,o.gamma,o.kappa);

%%visualize bboxes on edgemap
E_vis = repmat(uint8(E * 255), [1,1,3]);
cols = {'r', 'g', 'b'};
for k = 0:size(bbs, 1)/3 - 1
    figure(1), imshow(E_vis); hold on
    for id = 1:3
        i = k * 3 + id;
        rectangle('Position', bbs(i,1:4), 'EdgeColor', cols{id});
        text(double(bbs(i,1)), double(bbs(i,2)), num2str(bbs(i,5)), ...
            'HorizontalAlignment', 'center', 'BackgroundColor', 'w',...
            'color', cols{id});
    end
    hold off
    pause
end