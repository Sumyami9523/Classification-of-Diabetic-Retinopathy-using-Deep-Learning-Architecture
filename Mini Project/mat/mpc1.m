f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\*.png');
% for i=1:length(f)
for i=1:2
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\',f(i).name);
% read the Gaussian image
gaussImage = imread(filename);
% Apply Maximum Principle Curvature to extract vessel features
maxprincv = maxprinciplecurvature(gaussImage);

% Apply thresholding to create a binary mask of vessels
thresh = graythresh(maxprincv);
vesselMask = imbinarize(maxprincv, thresh);

% Clean up the mask by removing small objects and filling gaps
minArea = 20;
vesselMask = bwareaopen(vesselMask, minArea);
vesselMask = imfill(vesselMask, 'holes');

% Display the result
figure;
imshowpair(grayImage, vesselMask, 'montage');
title('Blood Vessels Extraction');
end