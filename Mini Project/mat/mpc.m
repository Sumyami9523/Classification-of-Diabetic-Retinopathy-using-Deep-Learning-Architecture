f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\*.png');
% for i=1:length(f)
for i=1:2
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\',f(i).name);
% read the Gaussian image
gaussImage = imread(filename);

% Apply Maximum Principle Curvature
maxprincv = maxprinciplecurvature(gaussImage);

% Load the mask image
mask = im2bw(grayImage,20/255);

% Erode the mask image
se = strel('octagon',24);
erodedmask = im2uint8(imerode(mask,se));
imshow(erodedmask);
% Apply the mask to the maxprincv image
maxprincvmsk = double(maxprincv) .* double(erodedmask/255);

% Display the masked Maximum Principle Curvature image
% imshow(maxprincvmsk);
end
