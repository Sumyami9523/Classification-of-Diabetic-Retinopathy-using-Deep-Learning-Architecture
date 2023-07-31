% Load image
f=dir('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gr\*.png');
% for i=1:length(f)
for i=1:2
filename = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\gr\',f(i).name);
% Load the retinal image
Igray = imread(filename);
%_____________________________________________
% Set the parameters for the Frangi filter
% options = struct('FrangiScaleRange',[2 4],'FrangiScaleRatio',1,'FrangiBetaOne',0.5,'FrangiBetaTwo',15,'verbose',false);

% Apply the Frangi filter
% J = frangi(I, options);

% Set the threshold for detecting structures
% threshold = 0.1;

% Threshold the output image
% Jthresh = J > threshold;

% Display the results
% subplot(1,2,1);
% imshow(I);
% title('Original Image');
% 
% subplot(1,2,2);
% imshow(Jthresh);
% title('Frangi Filtered Image');
%___________________________________________________

% Set the parameters for the Frangi filter
sigma = 2;
beta = 0.5;
c = 2*(beta^2);
scale_range = [1 8];
scale_step = 1;

% Compute the Hessian matrix at each pixel location
[Ix, Iy] = gradient(double(Igray));
[Ixx, ~] = gradient(Ix);
[~, Iyy] = gradient(Iy);

% Initialize the output image
J = zeros(size(Igray));

% Loop over the range of scales
for scale = scale_range(1):scale_step:scale_range(2)
    
    % Compute the eigenvalues of the Hessian matrix
    lambda1 = zeros(size(Igray));
    lambda2 = zeros(size(Igray));
    for i = 1:numel(Igray)
        H = [Ixx(i) Ix(i)*Iy(i); Ix(i)*Iy(i) Iyy(i)];
        [V, D] = eig(H);
        lambda1(i) = D(1,1);
        lambda2(i) = D(2,2);
    end
    
    % Compute the output image for this scale
    Rb = lambda1 ./ lambda2;
    S2 = lambda1.^2 + lambda2.^2;
    S = sqrt(S2);
    J = max(J, exp(-1*(Rb.^2) / c) .* (1 - exp(-1*(S2) / (2*(sigma^2)))));
    
end

% Set the threshold for detecting structures
threshold = 0.2;

% Threshold the output image
Jthresh = J > threshold;

% % Display the results
% subplot(1,2,1);
% imshow(Igray);
% title('Original Image');
% 
% subplot(1,2,2);
imshow(Jthresh);
% title('Frangi Filtered Image');
% name2 = strcat(f(i).name);
% path2 = strcat('C:\Users\cheta\OneDrive - sastra.ac.in\Desktop\Mini Project\Dataset\frangi\',name2);
% imwrite(Jtresh,path2)

end