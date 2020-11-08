%Import data - left vs right
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

labels = readtable('trainLabels.csv');
histogram(labels.level);

DR_0_images = {};
DR_1_images = {};
DR_2_images = {};
DR_3_images = {};
DR_4_images = {};

count_0_DR = 1;
count_1_DR = 1;
count_2_DR = 1;
count_3_DR = 1;
count_4_DR = 1;

for i = 1:1:35126
    if (labels.level(i) == 0)
        DR_0_images{count_0_DR} = labels.image(i);
        count_0_DR = count_0_DR + 1;
    elseif (labels.level(i) == 1)
        DR_1_images{count_1_DR} = labels.image(i);
        count_1_DR = count_1_DR + 1;
    elseif (labels.level(i) == 2)
        DR_2_images{count_2_DR} = labels.image(i);
        count_2_DR = count_2_DR + 1;
    elseif (labels.level(i) == 3)
        DR_3_images{count_3_DR} = labels.image(i);
        count_3_DR = count_3_DR + 1;
    elseif (labels.level(i) == 4)
        DR_4_images{count_4_DR} = labels.image(i);
        count_4_DR = count_4_DR + 1;
    end
end

DR_0_images = DR_0_images';
DR_1_images = DR_1_images';
DR_2_images = DR_2_images';
DR_3_images = DR_3_images';
DR_4_images = DR_4_images';

mkdir W:\NO_DR
mkdir W:\1_DR
mkdir W:\2_DR
mkdir W:\3_DR
mkdir W:\4_DR

for j = 1:1:25810
    for k = 1:1:4204
        if strcmp(DR_0_images{j,1},fnames_left{k,1})
            % disp('match');
            img = ds_left.Files{k};
            copyfile(img, 'W:\NO_DR');
        end
    end
end
disp('end 0');
for j = 1:1:2443
    for k = 1:1:4204
        if strcmp(DR_1_images{j,1},fnames_left{k,1})
            % disp('match');
            img = ds_left.Files{k};
            copyfile(img, 'W:\1_DR');
        end
    end
end
disp('end 1');
for j = 1:1:5292
    for k = 1:1:4204
        if strcmp(DR_2_images{j,1},fnames_left{k,1})
            % disp('match');
            img = ds_left.Files{k};
            copyfile(img, 'W:\2_DR');
        end
    end
end
disp('end 2');
for j = 1:1:873
    for k = 1:1:4204
        if strcmp(DR_3_images{j,1},fnames_left{k,1})
            % disp('match');
            img = ds_left.Files{k};
            copyfile(img, 'W:\3_DR');
        end
    end
end
disp('end 3');
for j = 1:1:708
    for k = 1:1:4204
        if strcmp(DR_4_images{j,1},fnames_left{k,1})
            % disp('match');
            img = ds_left.Files{k};
            copyfile(img, 'W:\4_DR');
        end
    end
end
disp('end 4');
