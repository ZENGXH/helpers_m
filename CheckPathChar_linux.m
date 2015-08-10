function path = CheckPathChar_linux(path)
path = strrep(path, '(', '\(');
path = strrep(path, ')', '\)');
