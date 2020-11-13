clc; clear all;

cd 'M:/Documents/MATLAB/BME3053C/batch1'

% contrast enhancement
% no denoising (did not seem necessary)

hold on
for i = 1:25
    ds_left = imageDatastore('*_left.jpeg');
    left_files = ds_left.Files;
    image = imread(left_files{i});
    greenImage = image(:,:,2);    
    histAdjustedGreen = adapthisteq(greenImage);
    histAdjustedGreen = imadjust(histAdjustedGreen);
    diffImage = imsubtract(greenImage, histAdjustedGreen);
     threshold = graythresh(diffImage);
     binarized = imbinarize(diffImage, threshold);
     subplot(5,5,i)   
   imshowpair(image, histAdjustedGreen, 'diff');    
end
hold off