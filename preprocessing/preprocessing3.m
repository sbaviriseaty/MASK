clc; clear all;
% https://www.mathworks.com/matlabcentral/fileexchange/50839-novel-retinal-vessel-segmentation-algorithm-fundus-images
cd 'M:/Documents/MATLAB/BME3053C/batch1'

 for i = 1:5
    ds_left = imageDatastore('*_left.jpeg');
    left_files = ds_left.Files;
    image = imread(left_files{i});
    greyImage = rgb2gray(image);
    adjustImage = imadjust(greyImage);
    contrastImage = adapthisteq(adjustImage);
     meanFilter = fspecial('average');
     maskMean = imfilter(contrastImage, meanFilter);
     maskMean2 = imsubtract(maskMean, contrastImage);
    maskBinarize = imbinarize(maskMean2);
     bw = bwareaopen(maskBinarize, 100);
    se = strel('disk', 1);
    bw = imclose(maskBinarize, se);
    cc = bwconncomp(bw, 8);
    numPixels = cellfun(@numel, cc.PixelIdxList);
    [biggest, idx] = max(numPixels);
    bw(cc.PixelIdxList{idx}) = 0;
    cc_1 = bwconncomp(bw, 26);
    removeVessels = bwpropfilt(bw, 'Eccentricity', [0, 0.9]);
     imshow(removeVessels);
 end
    