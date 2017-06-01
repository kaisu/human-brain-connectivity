function [TR, sliceOrder] = dataForPreprocessing(dicomfilename)
% Check some information needed in preprocessing with SPM
% 
% input: path to Siemens DICOM file
% output: TR (in seconds), slice order
%
% Note: in SPM, slice ordering is assumed to be from foot to head
% Check that info.PatientPosition = 'HFS' (?)


% Read DICOM header
info = dicominfo(dicomfilename);

% TR in seconds
TR = info.RepetitionTime / 1000;

% Read individual slice times and find the order
individualSliceTime = info.Private_0019_1029;
[~,sliceOrder] = sort(individualSliceTime);

