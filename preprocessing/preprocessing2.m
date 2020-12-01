clc; clear all;
% https://www.mathworks.com/matlabcentral/fileexchange/50839-novel-retinal-vessel-segmentation-algorithm-fundus-images
cd 'M:/Documents/MATLAB/BME3053C/batch1'

% grayscale vs green component image

for i = 1:25
    ds_left = imageDatastore('*_left.jpeg');
    left_files = ds_left.Files;
    image = imread(left_files{i});
    grayImage = rgb2gray(image);  
    histAdjustedGray = adapthisteq(grayImage);
    greenImage = image(:,:,2);  
    histAdjustedGreen = adapthisteq(greenImage);
    redImage = image(:,:,2);  
    histAdjustedRed = adapthisteq(redImage);
    diffImage = imsubtract(greenImage, histAdjustedGreen);
    threshold = graythresh(diffImage);
    binarized = imbinarize(diffImage, threshold);
    imshowpair(binarized, histAdjustedGreen, 'montage');
end