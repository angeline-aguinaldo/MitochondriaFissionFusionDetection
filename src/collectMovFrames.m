clear
clc
close all

ROOT = 'C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\Organelles\Organelles\14-08-13';
MOVIES = 'C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\Organelles\Organelles\Movies';
TEST = 'C:\Users\Angeline Aguinaldo\Documents\DREXEL 2012-2017\7th Term\ECES690\ECES690 - Final Project\Organelles\test';
flist = dir(ROOT);
cd(ROOT);

allframes = struct('high', [],'medium',[], 'low',[]);

 for z = 1:numel(flist)
     close all
     cd(ROOT); 
    if flist(z).bytes > 0  
        fname = flist(z).name;
        info = imfinfo(fname); 
        num_pages = numel(info);
    else
        continue;
    end

    for k = 1:num_pages
            subfiletype = info(k).NewSubFileType;
            movieframes = zeros(numel(find(subfiletype)==0));
            mov(1:movieframes)=struct('cdata',[],'colormap',[]);

         if subfiletype == 0
             
            [bw_img pixels] = mitochondriaFilter(fname,k);
                    
            B = bwboundaries(bw_img, 8, 'holes'); %traces boundaries
                                                               
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
                      
            mov(k)=getframe(gcf); 

         else
             continue;          
         end
    
    end
      
       for v = 1:numel(mov);
            if z <= 14
                allframes(end+1).high = mov(v).cdata;
            elseif z <= 26 && z > 14
                allframes(end+1).medium = mov(v).cdata;
            elseif z <=38 && z > 26
                allframes(end+1).low = mov(v).cdata;
            end
       end
               
 end

save('ECES690_Final_Project_allframes.mat');