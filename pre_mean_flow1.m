function [U1,V1,W1]=pre_mean_flow(u,v,w)

% Finds mean flow from frames obtaied at time moments t-1,t, t+1

global add nmr num div beta alpha nmr0 fle form gau hx hy hz mx ttolerance;

L_scale = char(4);
L_scale(1)='_';
L_scale(2) = 'S';
L_scale(3) = 'C';

name(4)=int2str(num-1);

l = 2

if num == nmr0
        %    [U,V,W]=Large_frame(U,V,W);
            [x y z] = size(u)
            t_u=ones(x,y,z);
            t_v=ones(x,y,z);
            t_w=ones(x,y,z);
            U1 = u;
            V1 = v;
            W1 = w;
    
 for num_loc=nmr0+1:nmr0+l
    
        fle(1:2)='00';
        fle(3)=int2str(num_loc);
        name(4)=int2str(num_loc);
        load(['field_3d/',fle,form]);

      % [U,V,W]=Large_frame(U,V,W);
       
       
       for i = 1:x
           for j = 1:y
               for k = 1:z
       
                U1(i,j,k) = U(i,j,k)+U1(i,j,k);
                V1(i,j,k) = V(i,j,k)+V1(i,j,k);
                W1(i,j,k) = W(i,j,k)+W1(i,j,k);
    
                if (U(i,j,k) ~= 0)
                    t_u(i,j,k) = t_u(i,j,k)+1;
                end
                
                if (V(i,j,k) ~= 0)
                    t_v(i,j,k) = t_v(i,j,k)+1;
                end
                
                if (W(i,j,k) ~= 0)
                    t_w(i,j,k) = t_w(i,j,k)+1;
                end  
           
               end
           end
       end
    
 end
 
 
       for i = 1:x
           for j = 1:y
               for k = 1:z
                   
                 if (U1(i,j,k) ~= 0)
                 
                      U1(i,j,k) = U1(i,j,k)/t_u(i,j,k);

                 end
           
                   if (V1(i,j,k) ~= 0)

                      V1(i,j,k) = V1(i,j,k)/t_v(i,j,k);

                   end
                   
                   if  (W1(i,j,k) ~= 0)
                 

                      W1(i,j,k) = W1(i,j,k)/t_w(i,j,k);

                 end               
                   
               end
           end
       end
  
else
    
    U1 = u;
    V1 = v;
    W1 = w;
    
    
    load(['result_3d/tmp.mat'],'u_tmp','v_tmp','w_tmp'); %----- saves u,v and w 
    
    U1 = u_tmp+U1;
    V1 = v_tmp+V1;
    W1 = w_tmp+W1;
    
    U1 = U1/2;
    V1 = V1/2;
    W1 = W1/2;
    
end

