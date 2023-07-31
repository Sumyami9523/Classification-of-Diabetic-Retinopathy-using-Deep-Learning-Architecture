% f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gr\*.png');
% for i=1:length(f)
% % for i=26:27
% filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gr\',f(i).name);
f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\*.png');
% for i=1:length(f)
for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\',f(i).name);
% read the RGB image
% grayImage = imread(filename);
Image1 = imread(filename);
Image = imresize(Image1, [512, 512]);
% Define the sigma value for the Gaussian filter
% --------------sigma = 1.45;

% Apply the Gaussian filter to the grayscale image
% --------------------filteredImage = imgaussfilt(Image, sigma);
filteredImage=imgaussfilt(Image(:,:,2) ,1.45);
% Display the filtered grayscale image
imshow(filteredImage);
% name2 = strcat(f(i).name);
% path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gauss2\',name2);
% imwrite(filteredImage,path2)
end
