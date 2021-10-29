function [u,v,w]=mean_flow_small(U,V,W)

% computes quasi laminar quasi stationary background flow 

 u = U;
 v = V;
 w = W;

[U1,V1,W1] = inserter(u,v,w,U,V,W); 
 
[x, y, z] =size(U);

times = (x - mod(x,2))/2 +1;

 for i = 1:times
     
[U1]=interpolate_your_neighbour1(U1);
[V1]=interpolate_your_neighbour1(V1);
[W1]=interpolate_your_neighbour1(W1);


 end

[U1]=interpolate_your_neighbour_angles(U1);
[V1]=interpolate_your_neighbour_angles(V1);
[W1]=interpolate_your_neighbour_angles(W1);



[u,v,w] = inserter(u,v,w,U1,V1,W1); 

% 
[u]=Gauss3D_matrix(0.55,u);
[v]=Gauss3D_matrix(0.55,v);
[w]=Gauss3D_matrix(0.55,w);

%[u,v,w] = inserter(u,v,w,U,V,W);







