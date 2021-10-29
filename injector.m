function [U,V,W]= injector(u,v,w)

%  Makes an injection of U,V,W on a 2-times finer grid.


[x, y, z] = size(w);

W = zeros(2*x,2*y,2*z);
V = zeros(2*x,2*y,2*z);
U = zeros(2*x,2*y,2*z);

W(1:2:2*x,1:2:2*y,1:2:2*z) = w(1:x,1:y,1:z);
V(1:2:2*x,1:2:2*y,1:2:2*z) = v(1:x,1:y,1:z);
U(1:2:2*x,1:2:2*y,1:2:2*z) = u(1:x,1:y,1:z);


















