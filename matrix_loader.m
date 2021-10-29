
function [L]=matrix_loader(x,y,z)

%global div;

% Loads or creates necessary matrixes for projection and 3-rd and 4-th
% steps. The subroutine creates matrixes automatically, if they do not
% exist and load them if they do exist.



fle = int2str(x);
a=fopen(['matrixes/L',fle,'.mat'],'r');

if a == -1
    
     matrix = ['L',fle,' Does not exist. I start creating it']
     [L]= Laplace3dl(x,y,z);
     save(['matrixes/L',fle,'.mat'],'L');

else
    
    load(['matrixes/L',fle,'.mat'],'L');
    matrix = ['L',fle,' Exists! I start loading it']
end



end


