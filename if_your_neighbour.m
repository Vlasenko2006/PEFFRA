function [u] = if_your_neighbour(um)

  % Smoothes the transitions between the boundaries of 2 neighbouring rectangules 

  [x,y,z]=size(um);
  
  u_t=um;

mdlx = (x-mod(x-1,2)+1)/2;
mdly = (y-mod(y-1,2)+1)/2;
mdlz = (z-mod(z-1,2)+1)/2;

u_t(1:x,1:y,mdlz-1)  =  (2*um(1:x,1:y,mdlz-2) + um(1:x,1:y,mdlz+2))/3;
u_t(1:x,mdly-1,1:z)  =  (2*um(1:x,mdly-2,1:z) + um(1:x,mdly+2,1:z))/3;
u_t(mdlx-1,1:y,1:z)  =  (2*um(mdlx-2,1:y,1:z) + um(mdlx+2,1:y,1:z))/3;


u_t(1:x,1:y,mdlz)  =  (um(1:x,1:y,mdlz-2) + um(1:x,1:y,mdlz+2))/2;
u_t(1:x,mdly,1:z)  =  (um(1:x,mdly-2,1:z) + um(1:x,mdly+2,1:z))/2;
u_t(mdlx,1:y,1:z)  =  (um(mdlx-2,1:y,1:z) + um(mdlx+2,1:y,1:z))/2;

u_t(1:x,1:y,mdlz+1)  =  (um(1:x,1:y,mdlz-2) + 2*um(1:x,1:y,mdlz+2))/3;
u_t(1:x,mdly+1,1:z)  =  (um(1:x,mdly-2,1:z) + 2*um(1:x,mdly+2,1:z))/3;
u_t(mdlx+1,1:y,1:z)  =  (um(mdlx-2,1:y,1:z) + 2*um(mdlx+2,1:y,1:z))/3;

u = u_t;
% 
%  [um]=Gauss3D_small2(1,u_t);
%  
%  
% u(1:x,1:y,mdlz-1)  =  um(1:x,1:y,mdlz-1);
% u(1:x,mdly-1,1:z)  =  um(1:x,mdly-1,1:z) ;
% u(mdlx-1,1:y,1:z)  = um(mdlx-1,1:y,1:z);
% 
% 
% u(1:x,1:y,mdlz)  =  um(1:x,1:y,mdlz);
% u(1:x,mdly,1:z)  =  um(1:x,mdly,1:z);
% u(mdlx,1:y,1:z)  =  um(mdlx,1:y,1:z);
% 
% u(1:x,1:y,mdlz+1)  =  um(1:x,1:y,mdlz+1);
% u(1:x,mdly+1,1:z)  =  um(1:x,mdly+1,1:z);
% u(mdlx+1,1:y,1:z)  =  um(mdlx+1,1:y,1:z);
% 
% 
% %
