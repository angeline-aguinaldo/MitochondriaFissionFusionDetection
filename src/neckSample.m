TEST = 'C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\Organelles\test';
flist = dir(TEST);
cd(TEST);

k = 33;
z = 3;

fname = flist(z).name;
[bw_img pixels] = mitochondriaFilter(fname,k);
 B = bwboundaries(bw_img, 8, 'holes');
 figure(k)
imshow(bw_img); hold on
plotname = sprintf('%s',num2str(flist(z).name));
underscore = find(plotname == '_');
plotname(underscore) = '-';
title(plotname);

traceMito(B, z); 

hold on
plot([100; 200], [550; 550], '-w','LineWidth', 3)
text(150,565, '8.5 \mum', 'HorizontalAlignment','center','color','white')  