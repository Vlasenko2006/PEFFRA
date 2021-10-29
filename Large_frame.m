function [U,V,W]=Large_frame(U,V,W)
global add nmr num div beta alpha nmr0 fle form gau;

[x1, y1, z1] = size(U);

    x = x1 + 2*add;
    y = y1 + 2*add;
    z = z1 + 2*add;
    
    U1 = zeros(x,y,z);
    V1 = zeros(x,y,z);
    W1 = zeros(x,y,z);
    
    U1(1+add:x1+add,1+add:y1+add,1+add:z1+add) = U(:,:,:);
    V1(1+add:x1+add,1+add:y1+add,1+add:z1+add) = V(:,:,:);
    W1(1+add:x1+add,1+add:y1+add,1+add:z1+add) = W(:,:,:);
    
    U = U1;
    V = V1;
    W = W1;
    
    