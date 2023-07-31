% Load the noisy image
img = imread('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\fff.png');

% Convert the image to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Apply morphological opening to detect salt and pepper noise
se = strel('square', 3);
opened_img = imopen(img, se);

% Compute the difference between the original and opened images
diff_img = imabsdiff(img, opened_img);

% Threshold the difference image to identify the noisy pixels
threshold = graythresh(diff_img);
noisy_pixels = imbinarize(diff_img, threshold);

% Display the results
figure;
subplot(2, 2, 1); imshow(img); title('Original Image');
subplot(2, 2, 2); imshow(opened_img); title('Opened Image');
subplot(2, 2, 3); imshow(diff_img); title('Difference Image');
subplot(2, 2, 4); imshow(noisy_pixels); title('Noisy Pixels');