clear
close all
clc
load('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\m-files\Collected Variables\fixframes.mat')
load('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\m-files\Collected Variables\fixgraphs.mat')
cd('C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project')

    init = 1;
    count = 0;
    
frame=struct('cdata',[],'colormap',[]);

for i = 1:300
    
    panel1 = fixframes(i).high;
    panel2 = fixframes(i).medium;
    panel3 = fixframes(i).low;
    
 
    if count < 25 && count > 1 ;
    elseif count == 1;
        panel4 = fixgraphs(init).high;
        panel5 = fixgraphs(init).medium;
        panel6 = fixgraphs(init).low;
    elseif mod(count,25) == 0
        panel4 = fixgraphs(init+(count/25)).high;
        panel5 = fixgraphs(init+(count/25)).medium;
        panel6 = fixgraphs(init+(count/25)).low;
    end 
    
    count = count + 1;
    
    fig = figure(1);
    plot1 = subplot(2,3,1);imshow(panel1);
    plot2 = subplot(2,3,2);imshow(panel2);
    plot3 = subplot(2,3,3);imshow(panel3);
    plot4 = subplot(2,3,4);imshow(panel4);
    plot5 = subplot(2,3,5);imshow(panel5);
    plot6 = subplot(2,3,6);imshow(panel6);
    
    shiftposr1 = [-0.1 -0.13 .2 .21];
    shiftposr2 = [-0.1 -0.11 .14 .15];
    
    pos1 = get(plot1, 'Position'); % gives the position of current sub-plot
    new_pos1 = pos1 + shiftposr1 + [0 0 0 0];
    set(plot1, 'Position',new_pos1); 
    
    pos2 = get(plot2, 'Position'); % gives the position of current sub-plot
    new_pos2 = pos2 + shiftposr1 + [0.01 0 0 0];
    set(plot2, 'Position',new_pos2); 
    
    pos3 = get(plot3, 'Position'); % gives the position of current sub-plot
    new_pos3 = pos3 + shiftposr1 + [0.03 0 0 0];
    set(plot3, 'Position',new_pos3); 
    
    pos4 = get(plot4, 'Position'); % gives the position of current sub-plot
    new_pos4 = pos4 + shiftposr2 + [0 0 0 0];
    set(plot4, 'Position',new_pos4); 
    
    pos5 = get(plot5, 'Position'); % gives the position of current sub-plot
    new_pos5 = pos5 + shiftposr2 + [0.019 0 0 0];
    set(plot5, 'Position',new_pos5); 
    
    pos6 = get(plot6, 'Position'); % gives the position of current sub-plot
    new_pos6 = pos6 + shiftposr2 + [0.043 0 0 0];
    set(plot6, 'Position',new_pos6);
    
    set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
        
    frame(i) = getframe(gcf);

end

moviefname = 'ECES690FinalMovie.mp4';
writerObj = VideoWriter(moviefname,'MPEG-4');
open(writerObj);
writeVideo(writerObj,frame);
close(writerObj);
