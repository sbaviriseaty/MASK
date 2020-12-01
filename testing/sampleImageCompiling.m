clc; clear all;

numFiles = 5;
address = 'M:\Documents\MATLAB\BME3053C\batch1Redo';
mkdir 'M:\Documents\MATLAB\BME3053C\batch1Redo'

DR_0 = imageDatastore('W:\NO_DR','FileExtensions','.jpeg');
DR_1 = imageDatastore('W:\1_DR','FileExtensions','.jpeg');
DR_2 = imageDatastore('W:\2_DR','FileExtensions','.jpeg');
DR_3 = imageDatastore('W:\3_DR','FileExtensions','.jpeg');
DR_4 = imageDatastore('W:\4_DR','FileExtensions','.jpeg');

num_0 = randi([1 size(DR_0.Files,1)],1,numFiles);
num_1 = randi([1 size(DR_1.Files,1)],1,numFiles);
num_2 = randi([1 size(DR_2.Files,1)],1,numFiles);
num_3 = randi([1 size(DR_3.Files,1)],1,numFiles);
num_4 = randi([1 size(DR_4.Files,1)],1,numFiles);

for i = 1:numFiles
    img_0 = DR_0.Files{num_0(i)};
    copyfile(img_0, address);
    img_1 = DR_1.Files{num_1(i)};
    copyfile(img_1, address);
    img_2 = DR_2.Files{num_2(i)};
    copyfile(img_2, address);
    img_3 = DR_3.Files{num_3(i)};
    copyfile(img_3, address);
    img_4 = DR_4.Files{num_4(i)};
    copyfile(img_4, address);
end


