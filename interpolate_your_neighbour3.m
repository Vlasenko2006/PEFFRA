
function [U,V,W]=interpolate_your_neighbour3(U,V,W)

[x, y, z] =size(U);

U_t = U;
V_t = V;
W_t = W;
sq = sqrt(2);
den = (1+sq);









%=============================================




%



for i = 2:x-1
    for j = 2:y-1
        for k=2:z-1

            if (U(i,j,k) ==0) && (U(i,j,k+1)~=0 || U(i,j,k-1)~=0 || ...
               U(i,j-1,k)~=0 || U(i,j+1,k)~=0 ||  U(i+1,j,k)~=0 || ...
               U(i-1,j,k)~=0 || U(i+1,j+1,k)~=0 || U(i-1,j-1,k)~=0 || ...
               U(i-1,j+1,k)~=0 || U(i+1,j-1,k)~=0 || U(i+1,j,k-1)~=0 || ...
               U(i+1,j,k+1)~=0 || U(i-1,j,k-1)~=0 || U(i+1,j,k+1)~=0 || ...
               U(i,j-1,k-1)~=0 || U(i,j+1,k-1)~=0 || U(i,j-1,k+1)~=0 ||...
               U(i,j+1,k+1)  )

               na = nnz( [U(i,j,k+1), U(i,j,k-1),U(i,j-1,k), U(i,j+1,k),...
                   U(i+1,j,k),U(i-1,j,k)]);

               nb =nnz([ U(i+1,j+1,k), U(i-1,j-1,k), U(i,j+1,k-1)...
               U(i-1,j+1,k), U(i+1,j-1,k), U(i+1,j,k-1), ...
               U(i+1,j,k+1), U(i-1,j,k-1), U(i+1,j,k+1), ...
               U(i,j-1,k-1), U(i,j+1,k+1), U(i,j-1,k+1)]);


                  if(na~=0 && nb == 0)

                    U_t(i,j,k) = (U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na;
                
                    V_t(i,j,k) = (V(i,j,k+1) + V(i,j,k-1) + ...
                    V(i,j-1,k) + V(i,j+1,k) +  V(i+1,j,k) + ...
                    V(i-1,j,k))/na;
                
                    W_t(i,j,k) = (W(i,j,k+1) + W(i,j,k-1) + ...
                    W(i,j-1,k) + W(i,j+1,k) +  W(i+1,j,k) + ...
                    W(i-1,j,k))/na;

                  end

                  if(na==0 && nb~=0)

                    U_t(i,j,k) = ( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k+1) + U(i,j-1,k+1) + ...
                    U(i,j+1,k-1))/nb;
                
                    V_t(i,j,k) = ( V(i+1,j+1,k) + V(i-1,j-1,k) + ...
                    V(i-1,j+1,k) + V(i+1,j-1,k) + V(i+1,j,k-1) + ...
                    V(i+1,j,k+1) + V(i-1,j,k-1) + V(i+1,j,k+1) + ...
                    V(i,j-1,k-1) + V(i,j+1,k+1) + V(i,j-1,k+1) + ...
                    V(i,j+1,k-1))/nb;
                
                    W_t(i,j,k) = ( W(i+1,j+1,k) + W(i-1,j-1,k) + ...
                    W(i-1,j+1,k) + W(i+1,j-1,k) + W(i+1,j,k-1) + ...
                    W(i+1,j,k+1) + W(i-1,j,k-1) + W(i+1,j,k+1) + ...
                    W(i,j-1,k-1) + W(i,j+1,k+1) + W(i,j-1,k+1) + ...
                    W(i,j+1,k-1))/nb;


                  end

                  if(na~= 0 && nb ~= 0)

                    U_t(i,j,k) = sq*((U(i,j,k+1) + U(i,j,k-1) + ...
                    U(i,j-1,k) + U(i,j+1,k) +  U(i+1,j,k) + ...
                    U(i-1,j,k))/na)/den + (( U(i+1,j+1,k) + U(i-1,j-1,k) + ...
                    U(i-1,j+1,k) + U(i+1,j-1,k) + U(i+1,j,k-1) + ...
                    U(i+1,j,k+1) + U(i-1,j,k-1) + U(i+1,j,k+1) + ...
                    U(i,j-1,k-1) + U(i,j+1,k-1) + U(i,j-1,k+1)+ U(i,j+1,k+1)...
                    )/nb)/den;

                
                    V_t(i,j,k) = sq*((V(i,j,k+1) + V(i,j,k-1) + ...
                    V(i,j-1,k) + V(i,j+1,k) +  V(i+1,j,k) + ...
                    V(i-1,j,k))/na)/den + (( V(i+1,j+1,k) + V(i-1,j-1,k) + ...
                    V(i-1,j+1,k) + V(i+1,j-1,k) + V(i+1,j,k-1) + ...
                    V(i+1,j,k+1) + V(i-1,j,k-1) + V(i+1,j,k+1) + ...
                    V(i,j-1,k-1) + V(i,j+1,k-1) + V(i,j-1,k+1)+ V(i,j+1,k+1)...
                    )/nb)/den;
                
                    W_t(i,j,k) = sq*((U(i,j,k+1) + W(i,j,k-1) + ...
                    W(i,j-1,k) + W(i,j+1,k) +  W(i+1,j,k) + ...
                    W(i-1,j,k))/na)/den + (( W(i+1,j+1,k) + W(i-1,j-1,k) + ...
                    W(i-1,j+1,k) + W(i+1,j-1,k) + W(i+1,j,k-1) + ...
                    W(i+1,j,k+1) + W(i-1,j,k-1) + W(i+1,j,k+1) + ...
                    W(i,j-1,k-1) + W(i,j+1,k-1) + W(i,j-1,k+1)+ W(i,j+1,k+1)...
                    )/nb)/den;
                
                
                  end


            end
        end
    end
end



U = U_t;
V = V_t;
W = W_t;



















             
               
               