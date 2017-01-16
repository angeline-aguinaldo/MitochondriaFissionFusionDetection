function [totalnecks, neckLoc] = neckCount(B)

% B is a structure that stores the boundary pixel locations for each object.
totalnecks = 0;
neckLoc = [];

    for j = 1:numel(B)
        perim = [B{j}];
        pairdist = pdist(perim,'euclidean');
        
        kernel = [5 5]; % get size of image
        sigma = 0.5; % define standard deviation of guassian distribution
        h = fspecial('gaussian',kernel, sigma); % create guassian low pass filter
        filterPerim = imfilter(pairdist,h,'symmetric');
        
        localmin = min(filterPerim,[],2);
        A = find(filterPerim == localmin);
        
        neck = numel(A);
        totalnecks = totalnecks + neck; % total branch regions
    end
        
end