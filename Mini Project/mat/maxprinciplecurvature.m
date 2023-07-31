function [maxprincv] = maxprinciplecurvature(grayImage)
    % Calculate the gradient of the grayscale image using the Sobel operator
    [Gx, Gy] = imgradientxy(grayImage, 'sobel');

    % Calculate the second order derivatives of the grayscale image using the Sobel operator
    [Gxx, Gxy] = imgradientxy(Gx, 'sobel');
    [~, Gyy] = imgradientxy(Gy, 'sobel');

    % Calculate the curvature values using the Maximum Principle Curvature operator
    maxprincv = sqrt((Gyy.^2 + Gxx.^2 + 2*Gxy.^2) ./ (Gx.^2 + Gy.^2));

    % Normalize the curvature values to the range [0, 1]
    maxprincv = (maxprincv - min(maxprincv(:))) ./ (max(maxprincv(:)) - min(maxprincv(:)));
end
