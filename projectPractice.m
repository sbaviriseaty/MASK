clc; clear;

tic
cd M:\Documents\MATLAB\BME3053C\sample
files = dir('*.jpeg');
numFiles = length(files);
images = cell(1 , numFiles);
% sizes = [];
sizes = cell(1 , numFiles);
colors = cell(1, numFiles);
grays = cell(1, numFiles);
binaries = cell(1, numFiles);

%% 

for num = 1:numFiles    
    images{num} = imread(files(num).name); 
    images{num} = uint8(images{num});
    sizes{num} = size(images{num});
    [R, G, B] = imsplit(images{num});
    colors{num} = [R, G, B];
    grays{num} = rgb2gray(images{num});
%     fprintf("File %s loaded. \n" ,files(num).name);    
    if mod(num, 2) == 0
%         imshowpair(images{num-1},images{num},'montage');
    end
end

clear -regexp ^R ^G ^B;
%% 

for num = 1:numFiles    
%     fprintf("File %s loaded. \n" ,files(num).name);    
    colors2Adj = imlocalbrighten(images{num});
%     imshowpair(images{num}, colors2Adj, "montage")
%     imhist(grays{num})
    grays2Adj = imadjust(grays{num});
%     imshowpair(grays{num}, grays2Adj, "montage")   
end

%% 

for num = 1:numFiles    
    BW = imbinarize(grays{num},"adaptive","ForegroundPolarity","dark");
    H = fspecial("average", 3);
    gssmooth = imfilter(grays{num}, H, "replicate");
    BWsmooth = imbinarize(gssmooth,"adaptive","ForegroundPolarity","dark");
%     imshow(BWsmooth)
%     pause(3)
    binaries{num} = BWsmooth;
end

%% 

for num = 1:numFiles    
    SE = strel("sphere", 8);
    Ibg = imclose(binaries{num},SE);
    gsSub = Ibg - binaries{num};
    BWsub = imbinarize(gsSub);
    imshowpair(images{num},BWsub,"montage");
end
toc

