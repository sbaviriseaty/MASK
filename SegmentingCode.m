clc; clear ; close all

filename = '13714_left.jpeg';
path = 'M:/Documents/MATLAB/BME3053C/batch1';
RGB = imread([path filename]);
figure
imshow(RGB)
title('Original Image')

% extract only green channel
I = RGB(:,:,2);
figure
imshow(I)
title('Grayscale Image')

J = adapthisteq(I);
figure
imshow(J)
title('Enhanced Image')

neighborhoodSize = [3 3];
K = medfilt2(J,neighborhoodSize);
figure
imshow(K);
title('Median Filter')

windowWidth = 3;
kernel = ones(windowWidth) / windowWidth ^2;
Kc = conv2(K, kernel,'same');
B = (uint8(Kc)*255) - K;
figure
imshow(B);
title('Image Prepration for Thresholding')

BW1 = B > 185;
figure
imshow(BW1);
title('Binary Image for vessels ')

BW2 = imcomplement(J > 28);
figure
imshow(BW2);
title('Binary Image for Background')

BW = xor(BW1,BW2);
figure
imshow(BW);
title('Binary Image')

% obtained the segmented image
maskedImage = J;
maskedImage(~BW) = 0;

% visualize the segmented image
figure
imshow(maskedImage)
title('Masked Image')