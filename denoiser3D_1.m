function [u,v,w]=denoiser3D(u,v,w,ut,vt,wt,A2,A4,tau,sigm,U,V,W)
global  beta alpha noisy_input;

%  A single step of PEFFRA on the current resolution.
%
%   Accepted values are  the velocities: "u,v,w," of a current vectorfield, 
% "ut,vt,wt" of a previous vectorfield., user parasmeters: alpha - the 
%  amplification of the second step,

tol1 = 5e-6;  
maxit1 = 4000;

[x,y,z] = size(u);

flag = 0;
it = 0;

while flag ~= 3

X=x*y;

omx = zeros(x,y,z);
omy = zeros(x,y,z);
omz = zeros(x,y,z);
oex = zeros(x,y,z);
oey = zeros(x,y,z);
oez = zeros(x,y,z);

  c = 0;  
  
  [ox,oy,oz]= omega3d_2th_order(u,v,w,x,y,z);
  [oxt,oyt,ozt]= omega3d_2th_order(ut,vt,wt,x,y,z);
  
  [ex,ey,ez]=VectorE_time_2nd_order_omega(x,y,z,u,v,w,ox,oy,oz,oxt,oyt,ozt,tau);
  
  if flag ~=2
     [u,v,w] = inserter(u,v,w,U,V,W);
  end 
  
  if noisy_input == 1 && flag == 1
     [u]=Gauss3D_matrix(sigm,u);
     [v]=Gauss3D_matrix(sigm,v);
     [w]=Gauss3D_matrix(sigm,w);
  end

  
  
   [omegax,omegay,omegaz]= omega3d_2th_order(u,v,w,x,y,z);
   

    for m=1:z
      for i=1:x   %_____________________________!!!!!2,-1 omega= zeros()____1 bok, est' eshe 1
         for j=1:y
            c = c+1;
            oex(i,j,m)= omegax(i,j,m)- alpha*ex(i,j,m); 
            oey(i,j,m)= omegay(i,j,m)- alpha*ey(i,j,m); 
            oez(i,j,m)= omegaz(i,j,m)- alpha*ez(i,j,m); 
         end  
      end
    end   

  


g1=cnv3d(x,y,z,oex,oey,oez);

clear oe ex2 ey2 ez2;

ps1= cgs(A2,g1',tol1,maxit1);



c= 0;

for m=1:z
for j=1:y
    for i=1:x
              c=c+1;
      omegax(i,j,m)=ps1(c);
      omegay(i,j,m)=ps1(c+X*z);
      omegaz(i,j,m)=ps1(c+2*X*z);
    end 
end
end



% %-----------------------------------------final

 [Oomegax,Oomegay,Oomegaz]= omega3d_2th_order(omegax,omegay,omegaz,x,y,z);
 


for m=1:z
for i=1:x
    for j=1:y

        omx(i,j,m)= beta*Oomegax(i,j,m)+u(i,j,m);
        omy(i,j,m)= beta*Oomegay(i,j,m)+v(i,j,m);
        omz(i,j,m)= beta*Oomegaz(i,j,m)+w(i,j,m);
    end
end
end
                                                                                                  
  
[g2]=cnv3d(x,y,z,omx,omy,omz);
ps2= cgs(A4,g2',1e-4,10000);


c= 0;
for m=1:z
for j=1:y
    for i=1:x
              c=c+1;
      u(i,j,m)=ps2(c);
      v(i,j,m)=ps2(c+X*z);
      w(i,j,m)=ps2(c+2*X*z);
    end 
end
end

[u] = Energy(u,U);
[v] = Energy(v,V);
[w] = Energy(w,W);

if it == 0
     it = it+1;
     Mean_angle_deviation = 360;
else
    [flag,Mean_angle_deviation,it]=termination_criterion(u,v,w,u_pr,v_pr,w_pr,it,Mean_angle_deviation,flag)
end

u_pr = u;
v_pr = v;
w_pr = w;

if flag ==2 
    flag = 3;
end

end


