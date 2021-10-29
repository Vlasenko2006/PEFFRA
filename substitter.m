function [U] = substitter(u)

% Substitutes spurious vectors occuring in problematic regions with their mean values

global add

[x,y,z] =size(u);

U = u;

M = mean(mean(mean(abs(u(1+add:x-add,1+add:y-add,add:z-add)))));


for i =1:x
    for j =1:y
        for k = 1:z
            
            if u(i,j,k) >= 1.*M 
                U(i,j,k) = u(i,j,k)*M/abs(u(i,j,k));
                
               % 'Hi'
                 
            end
            
            
        end
    end
end

U(add:x-add+1,add:y-add+1,add:z-add+1) = u(add:x-add+1,add:y-add+1,add:z-add+1);