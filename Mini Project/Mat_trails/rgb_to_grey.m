f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\*.png');
for i=1:length(f)
%for i=26:27
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\images\',f(i).name);
% read the RGB image
rgbImage1 = imread(filename);
rgbImage = imresize(rgbImage1, [512, 512]);
R = rgbImage(:,:,1);
G = rgbImage(:,:,2);
B = rgbImage(:,:,3);
 
% % Convert the color channels to double precision
R = im2double(R);
G = im2double(G);
B = im2double(B);
% 
% % Compute the grayscale image using the formula G = ⌊0.587R + 0.299G + 0.114B⌋
grayImage = 0.299*R + 0.587*G + 0.114*B;
% display the grayscale image
%----------------imshow(grayImage);----------------------------

%grayImage = rgb2gray(rgbImage);
%greenChannel = rgbImage(:,:,2); % extract green channel
%grayImage = 0.5 * grayImage + 0.5 * greenChannel; % combine grayscale and green channels

%imshow(grayImage);
name2 = strcat(f(i).name);
path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\Paper_For_Greyimgs\',name2);
imwrite(grayImage,path2)
end