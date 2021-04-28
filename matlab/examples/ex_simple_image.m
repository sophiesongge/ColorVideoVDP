% This example shows how to call FovVideoVDP and visualize its results. 

if ~exist( 'fovvdp', 'file' )
    addpath( fullfile( pwd, '..') );
end

I_ref = imread( 'wavy_facade.png' );
I_test_noise = imnoise( I_ref, 'gaussian', 0, 0.003 );
I_test_blur = imgaussfilt( I_ref, 2 );

[Q_JOD_noise, diff_map_noise] = fvvdp( I_test_noise, I_ref, 'display_name', 'sdr_4k_30', 'heatmap', 'threshold' );
[Q_JOD_blur, diff_map_blur] = fvvdp( I_test_blur, I_ref, 'display_name', 'sdr_4k_30', 'heatmap', 'threshold' );

clf
subplot( 2, 2, 1 );
imshow( I_test_noise );
title( 'Test image with noise' );

subplot( 2, 2, 3 );
imshow( diff_map_noise );
title( sprintf('Noise; Quality: %g JOD\n', Q_JOD_noise ) );


subplot( 2, 2, 2 );
imshow( I_test_blur );
title( 'Test image with blur' );

subplot( 2, 2, 4 );
imshow( diff_map_blur );
title( sprintf('Blur; Quality: %g JOD\n', Q_JOD_blur ) );