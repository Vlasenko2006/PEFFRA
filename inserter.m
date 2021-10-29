
function [u,v,w]= inserter(u,v,w,U,V,W)

% unserts the nonzero values of PTV data into u,v,w

[x,y,z]=size(u);


for i = 1:x
    for j = 1:y
        for k = 1:z
            
            if(U(i,j,k)~=0)
                
                u(i,j,k)= U(i,j,k);
                              
            end

        end

    end
end
    
for i = 1:x
    for j = 1:y
        for k = 1:z
            
            if(V(i,j,k)~=0)
                
                v(i,j,k)= V(i,j,k);
                
            end

        end

    end
end


for i = 1:x
    for j = 1:y
        for k = 1:z
            
            if(W(i,j,k)~=0)
                
                w(i,j,k)= W(i,j,k);
                
            end

        end

    end
end
    