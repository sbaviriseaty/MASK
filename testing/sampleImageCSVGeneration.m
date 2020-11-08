%create Excel spreadsheet recording names and labels of all sample dataset images
clc; clear all;

labels = readtable('trainLabels.csv');

cd 'M:\Documents\MATLAB\BME3053C\batch1'

ds = imageDatastore('*_left.jpeg');

fnames = ds.Files;

for h = 1:1:size(fnames)
    split = strsplit(fnames{h},'batch1Redo\');
    split = strsplit(split{2},'.jpeg');
    fnames{h} = split(1);
end

A = [];
B = [];

for j = 1:1:size(labels.image)
    for k = 1:1:size(fnames)
        if strcmp(labels.image(j), fnames{k})
            A = [A; labels.level(j)];
            B = [B; convertCharsToStrings(fnames{k}{1,1})];
        end
    end
end

writematrix(A,'batch1Redo.xls');
writematrix(B,'batch1Redo.xls','Sheet',1,'Range','B1');

