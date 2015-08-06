function CheckNaN(data)
if any(isnan(data(:)))
   error('NaN data occur!\n');
end