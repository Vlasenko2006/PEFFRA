function [u,v,w]=rescaler3D_new(u,v,w)
% Function makes injections on a finer grid.


[u,v,w]= injector(u,v,w);
[u,v,w]=Small_frame(u,v,w);
     
[u,v,w]=interpolate_your_neighbour3(u,v,w);



[u]=interpolate_your_neighbour_angles(u);
[v]=interpolate_your_neighbour_angles(v);
[w]=interpolate_your_neighbour_angles(w);



%[u,v,w] = inserter(u,v,w,U,V,W); 




