function [u,v,w]=small_frame_2(u1,v1,w1)
global add nmr num div beta alpha nmr0 fle form gau;

add1 = 1;
add2 = (add-add1);

[x y z] = size(u1)

    x = x - 2*add2;
    y = y - 2*add2;
    z = z - 2*add2;
    
    u = zeros(x,y,z);
    v = zeros(x,y,z);
    w = zeros(x,y,z);
    
   u(:,:,:) = u1(1+add2:x+add2,1+add2:y+add2,1+add2:z+add2);
   v(:,:,:) = v1(1+add2:x+add2,1+add2:y+add2,1+add2:z+add2);  
   w(:,:,:) = w1(1+add2:x+add2,1+add2:y+add2,1+add2:z+add2); 
    

    