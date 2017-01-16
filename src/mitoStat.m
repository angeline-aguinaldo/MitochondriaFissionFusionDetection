function [L num stat] = mitoStat(bw_img)

            [L num] = bwlabel(bw_img,8);

            stat = regionprops(L, 'Centroid');
end