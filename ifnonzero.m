
function  ifnzero(u_mean,u)


% unserts the nonzero values of PTV data into u,v,w

[x,y,z]=size(mean);



    c= 0;

for k=1:z
for j=1:y
    for i=1:x
        
        if u(i,j,k)==0
          u(i,j,k) = u_mean;            
        end
        
    end 
end
end