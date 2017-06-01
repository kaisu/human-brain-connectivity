% betaseries analysis definition for BASCO
basco_path = fileparts(which('BASCO'));
AnaDef.Img                  = 'nii';
AnaDef.Img4D                = false;      % true: 4D Nifti
AnaDef.NumCond              = 6;          % number of conditions
AnaDef.Cond                 = { 'GHF' , 'GLF' , 'GP' , 'NHF' , 'NLF' , 'NP'}; % names of conditions
AnaDef.units                = 'secs';    % unit 'scans' or 'secs'
AnaDef.RT                   = 2.33;          % repetition time in seconds
AnaDef.fmri_t               = 42;
AnaDef.fmri_t0              = 1;
AnaDef.OutDir               = 'betaseries';  % output directory
AnaDef.Prefix               = 'swra';
AnaDef.OnsetModifier        = 0; % subtract this number from the onset-matrix (unit: scans)  <===== 4 files deleted and starting at 0 !!!

AnaDef.VoxelAnalysis        = true;  
AnaDef.ROIAnalysis          = true; % ROI level analysis (estimate model on ROIs for network analysis)
AnaDef.ROIDir               = fullfile(basco_path,'rois','AALROI90'); % select all ROIs in this directory
AnaDef.ROIPrefix            = 'MNI_';
AnaDef.ROINames             = fullfile(basco_path,'rois','AALROI90','AALROINAMES.txt'); % txt.-file containing ROI names
AnaDef.ROISummaryFunction   = 'mean'; % 'mean' or 'median'

AnaDef.HRFDERIVS            = [0 0];  % temporal and disperion derivatives: [0 0] or [1 0] or [1 1]

% regressors to include into design
AnaDef.MotionReg            = true;
AnaDef.GlobalMeanReg        = false;

project_dir = '/Users/kolander/Documents/HBCcourse/human-brain-connectivity/Project';

% name of output-file (analysis objects)
AnaDef.Outfile              = fullfile(project_dir,'BascoData','out_estimated.mat');

cSubj = 0; % subject counter

vp = {'kh1', 'kh3', 'kh4', 'kh6', 'kh9'};

data_dir = fullfile(project_dir,'ProjectDataBasco'); % directory containing all subject folders

% all subjects
for i=1:length(vp)
    cSubj = cSubj+1;
    AnaDef.Subj{cSubj}.DataPath = fullfile(data_dir,vp{i}); 
    AnaDef.Subj{cSubj}.NumRuns  = 2;
    AnaDef.Subj{cSubj}.RunDirs  = {'epi1','epi2'};
    AnaDef.Subj{cSubj}.Onsets   = {'onsets1.txt','onsets2.txt'};
    AnaDef.Subj{cSubj}.Duration = [2 2 2 2 2 2];
end

%
AnaDef.NumSubjects = cSubj;
