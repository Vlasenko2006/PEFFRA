function [U]=Large_frame_gauss(U,add)

% Boundary conditions (created byb 7-point linear interpolator) for
% Gaussian filter

[x1, y1, z1] = size(U);

    x = x1 + 2*add;
    y = y1 + 2*add;
    z = z1 + 2*add;
    
    U1 = zeros(x,y,z);

    
    U1(1+add:x1+add,1+add:y1+add,1+add:z1+add) = U(:,:,:);

        
 for i = 1:add
     
[U1]=interpolate_your_neighbour(U1);

 end

[U]=interpolate_your_neighbour_angles(U1);


