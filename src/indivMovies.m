clear
close all
clc

load('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\m-files\Collected Variables\fixframes.mat')

for i = 1:300
    img = fixframes(i).high;
    fig = figure(1);
    img = imresize(img,[691,970]);
    set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
    imshow(img)
    frame(i) = im2frame(img);
end

moviefname = 'HighOleicAcid.mp4';
writerObj = VideoWriter(moviefname,'MPEG-4');
open(writerObj);
writeVideo(writerObj,frame);
close(writerObj);
close all

for i = 1:300
    img = fixframes(i).medium;
    fig = figure(1);
    img = imresize(img,[691,970]);
    set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
    imshow(img)
    frame(i) = im2frame(img);
end

moviefname = 'MediumOleicAcid.mp4';
writerObj = VideoWriter(moviefname,'MPEG-4');
open(writerObj);
writeVideo(writerObj,frame);
close(writerObj);
close all

for i = 1:300
    img = fixframes(i).low;
    fig = figure(1);
    img = imresize(img,[691,970]);
    set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
    imshow(img)
    frame(i) = im2frame(img);
end

moviefname = 'LowOleicAcid.mp4';
writerObj = VideoWriter(moviefname,'MPEG-4');
open(writerObj);
writeVideo(writerObj,frame);
close(writerObj);
close all