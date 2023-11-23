function segmentedCellSequence = batchProcessFiles(fcn,fileNames)
%batchProcessFiles Process image files.
%   SEQUENCE = batchProcessFiles(FCN,FILENAMES) loops over all the files
%   listed in FILENAMES, calls the function FCN on each of them, and
%   combines the results in SEQUENCE. FCN is a function handle for a
%   function with signature: B = FCN(A).

I = imread(fileNames{1});

% 480x640
[mrows,ncols] = size(I);
nImages = length(fileNames);

segmentedCellSequence = zeros(mrows,ncols,nImages,class(I));

parfor k = 1:nImages
    I = imread(fileNames{k});
    segmentedCellSequence(:,:,k) = fcn(I);
end

%#ok<*PFBNS>