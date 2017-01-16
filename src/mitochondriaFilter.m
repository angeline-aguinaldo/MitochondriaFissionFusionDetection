function [bw_img fpixels] = mitochondriaFilter(fname,k)

%Reads image file into MATLAB. Applies Otsu threshold. Converts to black
%and white and fills holes.

cell_image = imread(fname, k);
mito_img = cell_image(:,:,4); % reads only mitochondria channel

im_size = size(mito_img); % get size of image
sigma = 0.5; % define standard deviation of guassian distribution
h = fspecial('gaussian',im_size, sigma); % create guassian low pass filter
it = 25;
j = 0;

%MichelsContrastFilter

    while j < it; % only repeat guassian filtering for specified # of iterations
        contrast_im = imfilter(mito_img,h,'replicate'); %filter image using h
        mito_img = mito_img;
        j = j + 1; % counter for iterations
        pause(0.01) % delay to better see change in filters
    end

contrast_img = imadjust(mito_img);

level = graythresh(contrast_img); % finds Otsu threshold 
bw_img = im2bw(contrast_img,level); % converts image to binary image

bw_img = bwareaopen(bw_img,25);

bw_img = bwmorph(bw_img,'skel');

fpixels = numel(find(bw_img ==1));

end
