
function [Ut]=interpolate_your_neighbour(U)

% 7-point linear interpolator 

[x,y,z] = size(U);


Ut = U;

for i = 2:x-1
    for j = 2:y-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 && U(i,j,k-1)~=0 && ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) + U(i,j-1,k) +...
                             U(i,j,k+1) + U(i,j,k-1) )/6;
                
            end
            
            if (U(i,j,k) ==0) &&  (U(i,j,k+1)==0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) + U(i,j-1,k) +...
                             U(i,j,k-1) )/5;
                         
                         
            if (U(i,j,k) ==0) &&  (U(i,j,k+1)~=0 &&  U(i,j,k-1)==0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) + U(i,j-1,k) +...
                             U(i,j,k+1) )/5;
                
            end    
            
            if (U(i,j,k) ==0) &&  (U(i,j,k+1)~=0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)==0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) +...
                             U(i,j,k+1) + U(i,j,k-1) )/5;
                
            end
            
            if (U(i,j,k) ==0) &&  (U(i,j,k+1)~=0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)==0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j-1,k) +...
                             U(i,j,k+1) + U(i,j,k-1) )/5;
                
            end
            
            
            if (U(i,j,k) ==0) &&  (U(i,j,k+1)~=0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)==0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = (U(i-1,j,k) + U(i,j+1,k) + U(i,j-1,k) +...
                             U(i,j,k+1) + U(i,j,k-1) )/5;
                
            end
            
            
             if (U(i,j,k) ==0) &&   (U(i,j,k+1)~=0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)==0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i,j+1,k) + U(i,j-1,k) +...
                             U(i,j,k+1) + U(i,j,k-1) )/5;
                
            end            
                         
  %====================================================================================
  
              if (U(i,j,k) ==0) &&   (U(i,j,k+1)==0 &&  U(i,j,k-1)==0 &&  ...
               U(i,j-1,k)~=0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
                Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) + U(i,j-1,k))/4;
              
              end
  
  
  
              if (U(i,j,k) ==0) &&  (U(i,j,k+1)==0 &&  U(i,j,k-1)~=0 &&  ...
               U(i,j-1,k)==0 &&  U(i,j+1,k)~=0 &&   U(i+1,j,k)~=0 &&  U(i-1,j,k)~=0 )
           
               Ut(i,j,k) = ( U(i+1,j,k) + U(i-1,j,k) + U(i,j+1,k) + U(i,j,k-1) )/4;
                
              end
  
  
  
  
            end
        end
    end
end
