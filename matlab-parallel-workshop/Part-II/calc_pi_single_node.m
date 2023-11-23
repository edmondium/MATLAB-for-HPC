function calc_pi_single_node

p = gcp("nocreate");
if isempty(p)
    % Query for available cores
    sz = str2num(getenv('SLURM_TASKS_PER_NODE'));
    if isempty(sz), sz = maxNumCompThreads; end
    p = parpool("local",sz);
end

nsegments = p.NumWorkers;

% Range from 0 to 1, divided by number of workers
boundaries = linspace(0,1,nsegments+1);

parfor idx = 1:nsegments
    a = boundaries(idx)
    b = boundaries(idx+1);
    myIntegral(idx) = integral(@quadpi,a,b);
end

approx = sum(myIntegral);
fprintf('pi           : %.18f\n', pi)
fprintf('Approximation: %.18f\n', approx)
fprintf('Error        : %g\n',    abs(pi - approx))

end

function y = quadpi(x)
y = 4./(1 + x.^2);

end

%#ok<*ST2NM>
