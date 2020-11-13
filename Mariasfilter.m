clc; clear; close all;

%access 25 left eye photos
path = 'M:\Desktop\compapp\MASK Project\Mask\batch1\';
%create struct with 25 photos
files = dir(strcat(path,'\\*.jpeg'));

figure;
hold on;
%For loop to go through each pic
for ii = 1:length(files)
    I = imread(strcat(path,files(ii).name));
    gray = rgb2gray(I);
    %Contrast-limited adaptive histogram equalization (CLAHE) 
    edit = adapthisteq(gray,'clipLimit',0.005,'Distribution','exponential'); %clip limit decides how much contrast
    edit = imadjust(edit);
    subplot(5,5,ii);
    imshowpair(gray,edit,'montage');
    title('Original and Enhanced')
    
end
hold off

%Commented out is method using imadjust to homogenize images
% figure;
% hold on;
% for ii = 1:length(files)
%     I = imread(strcat(path,files(ii).name)); 
%     gray = rgb2gray(I);
%      adjust = imadjust(gray);
%      subplot(5,5,ii);
%    imshow(adjust);
%    
% end
% hold off


%Attempt to do a mean analysis - FAIL
% v = [];
% for ii = 1:3
%     I = imread(strcat(path,files(ii).name)); 
%     gray = rgb2gray(I);
%     value = mean(files(ii).name);
%    v = [v value];
% end
% disp(v)
% total = mean(v);
% disp(total);
% 
% for jj = 1:3
%     if v(jj)>total
%         files(jj).name = (files(jj).name) - (v(jj)-total);
%     elseif v(jj)<total
%         files(jj).name = (files(jj).name) + (total-v(jj));
%     end
% end
% 




