% Notes - "From Coding to Cluster"
% 1. Using a script, not a function
%       return status or output directory
% 2. Paths are hardcoded
%       pass in root directory
% 3. File separator is hardcoded
%       use fullfile
% 4. Assumes TIF files exist
%       check results when touching file system
% 5. TIF files must be on the MATLAB path
%       add tif folder to the MATLAB path
% 6. Assumes output folder already exists wherever MATLAB is running
%       supply output folder to write to.  check if folder exists;
%       if not, create it
% 7. Results MAT-File will be overwritten next time job is run
%       add timestamp to filename

filelist = dir('tif\*.tif');
fileNames = {filelist.name}';

segmentedCellSequence = batchProcessFiles(@detectCells,fileNames);
cd output
save SCS segmentedCellSequence
