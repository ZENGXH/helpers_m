function str = AddBackSlashBeforeUnderLine(str)
pos = strfind(str, '_');

if ~isempty(pos)
    str_new = [str(1:pos(1)-1), '\_']; %for the first '_'
    for n = 1:length(pos)-1        
        str_new = [str_new, str(pos(n)+1:pos(n+1)-1)];
        str_new = [str_new, '\_']; %for the (n+1)-th '_'
    end
    str_new = [str_new, str(pos(end)+1:end)];
    str = str_new;
end