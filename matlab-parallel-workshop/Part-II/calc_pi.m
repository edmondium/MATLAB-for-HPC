function calc_pi

p = gcp;
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
