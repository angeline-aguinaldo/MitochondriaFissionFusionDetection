
ROOT = 0; % Insert root image folder directory
MOVIES = 0; % Insert movie output directory

if ROOT == 0 && MOVIES == 0;
    error('You must include a root image folder and movie output directory.')
end

flist = dir(ROOT);
cd(ROOT);

allframes = struct('high', zeros(700,1),'medium',zeros(700,1), 'low',zeros(700,1));
allgraphs = struct('high', [],'medium',[], 'low',[]);
allobjects = struct('high', [],'medium',[], 'low',[]);

fusionData = [];
numObjData = [];

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
            graph(1:movieframes)=struct('cdata',[],'colormap',[]);
            object(1:movieframes)=struct('cdata',[],'colormap',[]);

         if subfiletype == 0
             
            [bw_img pixels] = mitochondriaFilter(fname,k);
            
            nObj = max(reshape(bwlabel(bw_img),[numel(bw_img),1]));
            totObj(k) = nObj;
            totObj(find(totObj == 0)) = [];
          
            B = bwboundaries(bw_img, 8, 'holes'); %traces boundaries
                                 
            totalnecks = neckCount(B);
                               
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

            npf(k) = totalnecks;
            npf(find(npf == 0)) = [];

         else
             continue;          
         end
    
    end
    
    figure(52)
    nplot = plot(totObj(1:25), '-bo','MarkerSize',5);
    plotname = sprintf('Number of Objects: %s',num2str(flist(z).name));
    underscore = find(plotname == '_');
    plotname(underscore) = '-';
    title(plotname);
    ylabel('Number of Objects (Normalized)');
    xlabel('Time (min)');
    set(gcf, 'Position', [30,450,450,350]);
    hold off;
    object(z) = getframe(gcf);
    
    tplot = fusionPlot(npf(1:25), pixels);
    plotname = sprintf('Fusion Plot: %s',num2str(flist(z).name));
    underscore = find(plotname == '_');
    plotname(underscore) = '-';
    title(plotname);
    set(gcf, 'Position', [400,450,450,350]);
    hold off;
    graph(z) = getframe(gcf);
    
    fusionData(z,:) = npf(1:25);
    numObjData(z,:) = totObj(1:25);
    
       for v = 1:numel(mov);
        init = 0;
            if z <= 14
                allframes(end+1).high = mov(v).cdata;
            elseif z <= 26 && z > 14
                allframes(end+1).medium = mov(v).cdata;
            elseif z <=38 && z > 26
                allframes(end+1).low = mov(v).cdata;
            end
       end
               
       for g = 1:numel(object);
        init = 0;
            if z <= 14
                allobjects(init+g).high = object(g).cdata;
            elseif z <= 26 && z > 14
                allobjects(init+g).medium = object(g).cdata;
            elseif z <=38 && z > 26
                allobjects(init+g).low = object(g).cdata;
            end
       end
        
        for w = 1:numel(graph);
            init = 0;
                if z <= 14
                    allgraphs(init+g).high = graph(g).cdata;
                elseif z <= 26 && z > 14
                    allgraphs(init+g).medium = graph(g).cdata;
                elseif z <=38 && z > 26
                    allgraphs(init+g).low = graph(g).cdata;
                end
            end
        
 end






