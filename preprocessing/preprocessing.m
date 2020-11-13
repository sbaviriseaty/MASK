clc; clear all;

cd 'M:/Documents/MATLAB/BME3053C/batch1'

% contrast enhancement
% no denoising (did not seem necessary)

for i = 1:5
    ds_left = imageDatastore('*_left.jpeg');
    left_files = ds_left.Files;
    image = imread(left_files{i});
    greenImage = image(:,:,2);    
    histAdjustedGreen = adapthisteq(greenImage);
%     diffImage = imsubtract(greenImage, histAdjustedGreen);
%      threshold = graythresh(diffImage);
%      binarized = imbinarize(diffImage, threshold);
    imshowpair(image, histAdjustedGreen, 'montage');    
end