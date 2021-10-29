function [u,v,w]=small_frame(u1,v1,w1)
global add nmr num div beta alpha nmr0 fle form gau;

[x y z] = size(u1)

    x = x - 2*add;
    y = y - 2*add;
    z = z - 2*add;
    
    u = zeros(x,y,z);
    v = zeros(x,y,z);
    w = zeros(x,y,z);
    
   u(:,:,:) = u1(1+add:x+add,1+add:y+add,1+add:z+add);
   v(:,:,:) = v1(1+add:x+add,1+add:y+add,1+add:z+add);  
   w(:,:,:) = w1(1+add:x+add,1+add:y+add,1+add:z+add); 
    

    