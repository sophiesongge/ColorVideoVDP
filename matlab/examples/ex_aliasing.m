% This example shows how to run FovVideoVD on the downsampling/upsampling
% example from README.md

if ~exist( 'fovvdp', 'file' )
    addpath( fullfile( pwd, '..') );
end

display_name = 'sdr_4k_30';

ref_file = '../../pytorch_examples/aliasing/ferris-ref.mp4';
TST_FILEs = dir( '../../pytorch_examples/aliasing/ferris-*-*.mp4' );

options = {};
quiet = false;
for dd=1:length(TST_FILEs)
    test_file = fullfile( TST_FILEs(dd).folder, TST_FILEs(dd).name );
    tic
    [Q_JOD] = fvvdp( test_file, ref_file, 'display_name', display_name, 'heatmap', 'threshold', 'foveated', true, 'quiet', quiet, 'options', options );
    toc
    fprintf( 1, '==== %s: Q_JOD = %g\n', TST_FILEs(dd).name, Q_JOD );
    quiet = true;
end
