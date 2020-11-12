clc; clear all;
% https://www.mathworks.com/matlabcentral/fileexchange/50839-novel-retinal-vessel-segmentation-algorithm-fundus-images
cd 'M:/Documents/MATLAB/BME3053C/batch1'

% grayscale vs green component image

 for i = 1:5
    ds_left = imageDatastore('*_left.jpeg');
    left_files = ds_left.Files;
    image = imread(left_files{i});
    grayImage = rgb2gray(image);  
    histAdjustedGray = adapthisteq(grayImage);
    greenImage = image(:,:,2);  
    histAdjustedGreen = adapthisteq(greenImage);
%     diffImage = imsubtract(grayImage, histAdjusted);
%     threshold = graythresh(diffImage);
%     binarized = imbinarize(diffImage, threshold);
    imshowpair(histAdjustedGray, histAdjustedGreen, 'montage');
 end