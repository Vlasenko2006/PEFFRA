function [u,v,w]=smoother(u,v,w,U,V,W,L)

global noisy_input;




[x, y, z] = size(U);
  


flag = 0;
it = 0;

while flag ~= 2
    
  if noisy_input ~= 1 && flag ~=1 && noisy_input == 1
    [u,v,w] = inserter(u,v,w,U,V,W);  
  end
  
  [omegax,omegay,omegaz]= omega3d_2th_order(u,v,w,x,y,z);
 
  
  g1=cnv3d(x,y,z,omegax,omegay,omegaz);


   Z = x*y*z;
   L_E2 = speye(3*Z,3*Z)-.01*L ;
   
  [ps1] = cgs(L_E2,g1',10e-4,100);
   
c = 0;  

for m=1:z
for j=1:y
    for i=1:x
              c=c+1;
      omegax(i,j,m)=ps1(c);
      omegay(i,j,m)=ps1(c+x*y*z);
      omegaz(i,j,m)=ps1(c+2*x*y*z);
    end 
end
end



 [Oomegax,Oomegay,Oomegaz]= omega3d_2th_order(omegax,omegay,omegaz,x,y,z);

omx = Oomegax+u;
omy = Oomegay+v;
omz = Oomegaz+w;


[g1]=cnv3d(x,y,z,omx,omy,omz); 

 Z = x*y*z;
 
 L_E2 = speye(3*Z,3*Z)-L ;
   
  [ps1] = cgs(L_E2,g1',10e-4,100);
   
c = 0;  
 for m=1:z
for j=1:y
    for i=1:x
              c=c+1;
     u(i,j,m)=ps1(c);
     v(i,j,m)=ps1(c+x*y*z);
     w(i,j,m)=ps1(c+2*x*y*z);
    end 
end
end  

  


[u] = Energy(u,U);
[v] = Energy(v,V);
[w] = Energy(w,W);
  [u,v,w] = inserter(u,v,w,U,V,W);  
% [q,RMS1,divergence] = quality_checker(u,v,w,U,V,W)
 
if it == 0
     it = it+1;
     Mean_angle_deviation = 360;
else
    [flag,Mean_angle_deviation,it]=termination_criterion(u,v,w,u_pr,v_pr,w_pr,it,Mean_angle_deviation,flag)
end

u_pr = u;
v_pr = v;
w_pr = w;
end





