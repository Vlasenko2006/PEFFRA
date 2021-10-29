
function [U]=interpolate_your_neighbour_angles(U)

[x y z] =size(U);

U_t = U;
sq = sqrt(2);
den = (1+sq);

%-------------------------------------------------------------------------

 i = 1;
    for j = 2:y-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 || U(i,j,k-1)~=0 || ...
               U(i,j-1,k)~=0 || U(i,j+1,k)~=0 ||  U(i+1,j,k)~=0 || ...
                U(i+1,j-1,k)~=0 || U(i+1,j,k-1)~=0 || ...
               U(i+1,j,k+1)~=0 || U(i+1,j+1,k)~=0 || U(i+1,j,k+1)~=0 || ...
               U(i,j-1,k-1)~=0 || U(i,j+1,k+1)~=0 || U(i,j-1,k+1)~=0 || ...
               U(i,j+1,k-1))
               
               na = nnz( [U(i,j,k+1), U(i,j,k-1),U(i,j-1,k), U(i,j+1,k),...
                   U(i+1,j,k),]);
           
               nb =nnz([ U(i+1,j+1,k), U(i,j+1,k+1) ...
               U(i+1,j-1,k), U(i+1,j,k-1), ...
               U(i+1,j,k+1), U(i+1,j,k+1), ...
               U(i,j-1,k-1), U(i,j+1,k-1), U(i,j-1,k+1)]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = (U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = ( U(i+1,j+1,k) +  + ...
                     + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) +  + U(i+1,j,k+1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k-1) + U(i,j+1,k+1 )+ U(i,j-1,k+1))/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*((U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k))/na)/den +...
                    (( U(i+1,j+1,k) +...
                     + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) +  + U(i+1,j,k+1) + U(i,j+1,k-1) +...
                    U(i,j-1,k-1) + U(i,j+1,k+1) + U(i,j-1,k+1))/nb)/den;
             
                  end
                  
                
            end
        end
    end

    
    %------------------------------------------------


 i = x;
    for j = 2:y-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 || U(i,j,k-1)~=0 || ...
               U(i,j-1,k)~=0 || U(i,j+1,k)~=0 || ...
               U(i-1,j,k)~=0 || U(i-1,j-1,k)~=0 || U(i,j+1,k-1) || ...
               U(i-1,j+1,k)~=0 || U(i-1,j,k-1)~=0 ||...
               U(i,j-1,k-1)~=0 || U(i,j+1,k+1)~=0 || U(i,j-1,k+1)~=0 )
               
               na = nnz( [U(i,j,k+1), U(i,j,k-1),U(i,j-1,k), U(i,j+1,k),...
                    U(i-1,j,k)]);
           
               nb =nnz([ U(i-1,j-1,k), ...
               U(i-1,j+1,k), U(i,j+1,k-1)...
               U(i-1,j,k-1),...
               U(i,j-1,k-1), U(i,j+1,k+1), U(i,j-1,k+1)]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = (U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +   + ...
                    U(i-1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = (U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i,j+1,k-1)+...
                    U(i-1,j,k-1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k+1) + U(i,j-1,k+1))/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*((U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k)  + ...
                    U(i-1,j,k))/na)/den + ((U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i,j+1,k-1) + ...
                    U(i-1,j,k-1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k+1) + U(i,j-1,k+1))/nb)/den;
             
                  end
                  
                
            end
        end
    end



%======================================================================

j = 1;



for i = 2:x-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 || U(i,j,k-1)~=0 || ...
               U(i,j+1,k)~=0 ||  U(i+1,j,k)~=0 || U(i,j+1,k-1) || ...
               U(i-1,j,k)~=0 || U(i+1,j+1,k)~=0 ||...
               U(i-1,j+1,k)~=0 || U(i+1,j,k-1)~=0 || ...
               U(i+1,j,k+1)~=0 || U(i-1,j,k-1)~=0 || U(i+1,j,k+1)~=0 ...
               || U(i,j+1,k+1)~=0)
               
               na = nnz( [U(i,j,k+1), U(i,j,k-1), U(i,j+1,k),...
                   U(i+1,j,k),U(i-1,j,k)]);
           
               nb =nnz([ U(i+1,j+1,k), U(i,j+1,k-1), ...
               U(i-1,j+1,k), U(i+1,j,k-1), ...
               U(i+1,j,k+1), U(i-1,j,k-1), U(i+1,j,k+1), ...
               U(i,j+1,k+1), ]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = (U(i,j,k+1) + U(i,j,k-1) + ...
                     + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = ( U(i+1,j+1,k) +  U(i,j+1,k-1) +...
                    U(i-1,j+1,k) +  U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                     + U(i,j+1,k+1) )/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*((U(i,j,k+1) + U(i,j,k-1) + ...
                     + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na)/den + (( U(i+1,j+1,k) + ...
                    U(i-1,j+1,k) +   U(i+1,j,k-1) +U(i,j+1,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                     + U(i,j+1,k+1) )/nb)/den;
             
                  end
                  
                
            end
        end
end




%===========================================================================

j = y;
for i = 2:x-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 || U(i,j,k-1)~=0 || ...
               U(i,j-1,k)~=0 ||  U(i+1,j,k)~=0 || ...
               U(i-1,j,k)~=0 || U(i-1,j-1,k)~=0 || ...
               U(i+1,j-1,k)~=0 || U(i+1,j,k-1)~=0 || ...
               U(i+1,j,k+1)~=0 || U(i-1,j,k-1)~=0 || U(i+1,j,k+1)~=0 || ...
               U(i,j-1,k-1)~=0 || U(i,j-1,k+1)~=0 )
               
               na = nnz( [U(i,j,k+1), U(i,j,k-1),U(i,j-1,k), ...
                   U(i+1,j,k),U(i-1,j,k)]);
           
               nb =nnz([ U(i-1,j-1,k), ...
               U(i+1,j-1,k), U(i+1,j,k-1), ...
               U(i+1,j,k+1), U(i-1,j,k-1), U(i+1,j,k+1), ...
               U(i,j-1,k-1), U(i,j-1,k+1)]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = (U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) +  +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = (  + U(i-1,j-1,k) + ...
                     + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                    U(i,j-1,k-1) +  + U(i,j-1,k+1))/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*((U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) +  +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na)/den + ((  + U(i-1,j-1,k) + ...
                     + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                    U(i,j-1,k-1) +  + U(i,j-1,k+1))/nb)/den;
             
                  end
                  
                
            end
        end
end


%==========================================================================

k = 1; 

for i = 2:x-1
    for j = 2:y-1

        if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 ||  ...
               U(i,j-1,k)~=0 || U(i,j+1,k)~=0 ||  U(i+1,j,k)~=0 || ...
               U(i-1,j,k)~=0 || U(i+1,j+1,k)~=0 || U(i-1,j-1,k)~=0 || ...
               U(i-1,j+1,k)~=0 || U(i+1,j-1,k)~=0 || ...
               U(i+1,j,k+1)~=0 || U(i+1,j,k+1)~=0 || ...
               U(i,j-1,k+1)~=0 || U(i,j+1,k+1)  )
               
               na = nnz( [U(i,j,k+1),U(i,j-1,k), U(i,j+1,k),...
                   U(i+1,j,k),U(i-1,j,k)]);
           
               nb =nnz([ U(i+1,j+1,k), U(i-1,j-1,k), ...
               U(i-1,j+1,k), U(i+1,j-1,k), ...
               U(i+1,j,k+1), U(i+1,j,k+1), ...
               U(i,j-1,k+1),U(i+1,j+1,k) ]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = (U(i,j,k+1) +  + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = ( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) +  + ...
                    U(i+1,j,k+1) +  + U(i+1,j,k+1) + ...
                     + U(i,j-1,k+1) + U(i+1,j+1,k)...
                    )/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*((U(i,j,k+1) +...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na)/den + (( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) + ...
                    U(i+1,j,k+1) + U(i+1,j,k+1) + ...
                     + U(i,j-1,k+1)+ U(i,j+1,k+1)...
                    )/nb)/den;
             
                  end
                  
                
        end
    end
end


%=======================================================

k = z;



for i = 2:x-1
    for j = 2:y-1


            if (U(i,j,k) ==0) && ( U(i,j,k-1)~=0 || ...
               U(i,j-1,k)~=0 || U(i,j+1,k)~=0 ||  U(i+1,j,k)~=0 || ...
               U(i-1,j,k)~=0 || U(i+1,j+1,k)~=0 || U(i-1,j-1,k)~=0 || ...
               U(i-1,j+1,k)~=0 || U(i+1,j-1,k)~=0 || U(i+1,j,k-1)~=0 || ...
               U(i-1,j,k-1)~=0 || ...
               U(i,j-1,k-1)~=0 || U(i,j+1,k-1)~=0)
               
               na = nnz( [U(i,j,k-1),U(i,j-1,k), U(i,j+1,k),...
                   U(i+1,j,k),U(i-1,j,k)]);
           
               nb =nnz([ U(i+1,j+1,k), U(i-1,j-1,k), U(i,j+1,k-1)...
               U(i-1,j+1,k), U(i+1,j-1,k), U(i+1,j,k-1), ...
               U(i-1,j,k-1), ...
               U(i,j-1,k-1),]);
           
           
                  if(na~=0 && nb == 0)
           
                    U_t(i,j,k) = ( + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na;
             
                  end
           
                  if(na==0 && nb~=0)
           
                    U_t(i,j,k) = ( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    + U(i-1,j,k-1) + U(i,j-1,k-1) + U(i,j+1,k-1))/nb; 
           
                  end
                  
                  if(na~= 0 && nb ~= 0)
           
                    U_t(i,j,k) = sq*(( + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na)/den + (( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                     + U(i-1,j,k-1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k-1) ...
                    )/nb)/den;
             
                  end
                  
                
            end
        end
end


% ++++++++++++++++++++++++



  for k=1:z

      U_t(1,1,k) = (U(2,2,k) + U(2,3,k))/2;
      U_t(1,y,k) = (U(3,y-1,k) + U(2,y-2,k))/2;
      U_t(x,y,k) = (U(x-2,y,k) + U(x,y-2,k))/2;
      U_t(x,1,k) = (U(x-2,1,k) + U(x-1,2,k))/2;
  end

  for i = 1:x
      
        U_t(i,1,z) = (U(i,2,z-2) + U(i,2,z-1))/2;
        U_t(i,1,1) = (U(i,2,2) + U(i,2,3))/2;
        U_t(i,y,z) = (U(i,y-2,z-1) + U(i,y-1,z-2))/2;
        U_t(i,y,1) = (U(i,y-2,3) + U(i,y-1,z-2))/2;        

  end
  
  
  for j = 1:y
      
        U_t(1,j,x) = (U(2,j,x-2) + U(2,j,x-3))/2;
        U_t(1,j,1) = (U(2,j,2) + U(2,j,3))/2;
        U_t(x,j,z) = (U(x-2,j,z-1) + U(x-1,j,z-2))/2;
        U_t(x,j,1) = (U(x-2,j,3) + U(x-1,j,z-2))/2;
        
  end



U = U_t;