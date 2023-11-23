function simJob = batchsim_example(~)

c = parcluster;
c.AdditionalProperties.WallTime = '00:15:00';

mdl = 'ex_sldemo_househeat';

% Open and load model
openExample('simulink/OpenTheModelExample')
open_system(mdl)
load_system(mdl)

% Define temperatures
temps = 62:4:84;
tlen = length(temps);

% Initialize Simulation Inputs
in(1:tlen) = Simulink.SimulationInput(mdl);
for tidx = 1:tlen
    in(tidx) = in(tidx).setBlockParameter( ...
        [mdl '/Set Point'],'Value',num2str(temps(tidx)));
end

% Submit job
simJob = batchsim(c, in, 'ShowProgress','on', ...
    'StopOnError','on', 'Pool',tlen);

end
