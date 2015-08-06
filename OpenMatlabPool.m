function OpenMatlabPool(num_pool)
if nargin < 1
    num_pool = Inf;
end

num_pool = min(num_pool, maxNumCompThreads);

if matlabpool('size')<=0
    if verLessThan('matlab', '8.3.0')
        matlabpool('local', min(12, num_pool));
    else
        matlabpool('local', min(32, num_pool));
    end
end