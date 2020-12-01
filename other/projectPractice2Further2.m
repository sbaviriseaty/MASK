clc; clear all;

cd M:\Documents\MATLAB\BME3053C\sample
files = dir('*.jpeg');

numFiles = length(files);
images = cell(1 , numFiles);
sizes = cell(1 , numFiles);

row = 0;
column = 0;

for num = 1:numFiles    
    images{num} = uint8(imread(files(num).name)); 
    sizes{num} = size(images{num});
    row = row + sizes{num}(1);
    column = column + sizes{num}(2);
end

row = row / numFiles;
column = column / numFiles;

for num = 1:numFiles    
    old = images{num};
    images{num} = imresize(images{num},[row column]);
    new = images{num};
    [~,threshold] = edge(rgb2gray(new),'sobel');
    BWs = edge(rgb2gray(new),'sobel', threshold * 0.5);
    imshow(BWs);
%     imshowpair(old, new, 'montage');    
end