function ids_chosen = NMS_1D(ids, vals, winhalf)
assert(all(ids > 0));
assert(length(ids) == length(vals));
assert(winhalf >= 0);

isavai = true(max(ids), 1);
[~, id_st] = sort(vals, 'descend');

ids_chosen = [];
for k = 1:length(vals)
    i = id_st(k);
    if isavai(i)
        ids_chosen = [ids_chosen, ids(i)];
        isavai(1:i-winhalf) = false;
        isavai(i+1:i+winhalf-1) = false;
    end
end