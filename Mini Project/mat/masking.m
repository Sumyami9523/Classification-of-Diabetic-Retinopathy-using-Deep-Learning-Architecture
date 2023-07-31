f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\*.png');
% for i=1:length(f)
for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss\',f(i).name);
% read the RGB image
grayImage = imread(filename);

% Create a binary mask (all white) of the same size as the RGB image
% mask = ones(size(grayImage, 1), size(grayImage, 2));
mask = im2bw(grayImage,20/255);
% imshow(mask);
% --------------------------------------
% Oka vela Accuracy not come try this, ramoving unwanted part of img
% -----------------------------------------
% Apply the mask to the RGB image
% maskedgrayImage = bsxfun(@times, grayImage, cast(mask, 'like', grayImage));
% imshow(maskedgrayImage);
% ----------------------------------------
se = strel('octagon',24);
erodedmask = im2uint8(imerode(mask,se));
% Display the masked RGB image
imshow(erodedmask);
% name2 = strcat(f(i).name);
% path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\maskimg\',name2);
% imwrite(grayImage,path2)
end