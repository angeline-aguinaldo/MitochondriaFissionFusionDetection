function [ ] = traceMito(B, z)

%B = structure of boundary information
%stat = structure of object information
%z = filename index from flist

        for l = 1:length(B) % B is structure of all boundary information
            b = B{l}; % extracts each cell array from B
            if z <= 14
                if mod(z,2) == 0 
                    plot(b(:,2),b(:,1),'r','linewidth',1); % draws outline
                elseif mod(z,2) ~= 0 
                    plot(b(:,2),b(:,1),'m','linewidth',1); % draws outline
                end
            elseif z <= 26 && z > 14
                if mod(z,2) == 0 
                    plot(b(:,2),b(:,1),'g','linewidth',1); % draws outline
                elseif mod(z,2) ~= 0 
                    plot(b(:,2),b(:,1),'y','linewidth',1); % draws outline
                end
            elseif z <=38 && z > 26
                if mod(z,2) == 0 
                    plot(b(:,2),b(:,1),'b','linewidth',1); % draws outline
                elseif mod(z,2) ~= 0 
                    plot(b(:,2),b(:,1),'c','linewidth',1); % draws outline
                end
            end
        end
end