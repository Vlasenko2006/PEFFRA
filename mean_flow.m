function [u,v,w]=mean_flow(U,V,W,L)

global add nmr num div beta alpha nmr0 fle form gau hx hy hz mx ttolerance;

 
[u,v,w]=mean_flow_small(U,V,W);
     
[u,v,w]=smoother(u,v,w,U,V,W,L);



