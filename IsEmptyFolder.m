function isEmpty = IsEmptyFolder(path)
cnts = dir(path);
isEmpty = length(cnts) == 2;