function calc_pi_with_spmd

c = parcluster("local");

% Query for available cores
sz = str2num(getenv('LSB_DJOB_NUMPROC'));
if isempty(sz), sz = maxNumCompThreads; end

if isempty(gcp('nocreate')), c.parpool(sz); end

spmd
    a = (labindex - 1)/numlabs;
    b = labindex/numlabs;
    fprintf('Subinterval: [%-4g, %-4g]\n', a, b)

    myIntegral = integral(@quadpi, a, b);
    fprintf('Subinterval: [%-4g, %-4g]   Integral: %4g\n', a, b, myIntegral)

    piApprox = gplus(myIntegral);
end

approx = piApprox{1};   % 1st element holds value on worker 1
fprintf('pi           : %.18f\n', pi)
fprintf('Approximation: %.18f\n', approx)
fprintf('Error        : %g\n',    abs(pi - approx))

end

function y = quadpi(x)
y = 4./(1 + x.^2);

end

%#ok<*ST2NM,*DNUMLABS,*DLABINDEX,*DGPLUS>