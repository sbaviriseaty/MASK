clc; clear all;

cd M:\Documents\MATLAB\BME3053C\train

ds_left = imageDatastore('*_left.jpeg');
ds_right = imageDatastore('*_right.jpeg');

fnames_left = ds_left.Files;
for h = 1:1:4204
    split = strsplit(fnames_left{h},'train\');
    split = strsplit(split{2},'.jpeg');
    fnames_left{h} = split(1);
end
fnames_right = ds_right.Files;

% left_images = readall(ds_left);
% right_images = readall(ds_right);

cd M:\Documents\MATLAB\BME3053C

numLeftImages = [3063 284 668 110 78];
percentLeftImages = numLeftImages ./ sum(numLeftImages);

labels = readtable('trainLabels.csv');
numTotalImages = [sum(labels.level == 0), sum(labels.level == 1), sum(labels.level == 2), sum(labels.level == 3), sum(labels.level == 4)];
numTotalLeftImages = numTotalImages ./ 2;
percentTotalLeftImages = numTotalLeftImages ./ sum(numTotalLeftImages);

disp(percentLeftImages ./ percentTotalLeftImages);