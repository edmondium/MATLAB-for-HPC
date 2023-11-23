function t = example_code(sims)

disp('Start sim')

A = nan(sims,1);
t0 = tic;
parfor idx = 1:sims
    A(idx) = idx;
    pause(1)
end
t = toc(t0);

disp('Finished')

end

%#ok<*PFOUS>