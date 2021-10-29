function [u,v,w,u_add_time,v_add_time, w_add_time] = enlarger(u,v,w,u_add_time,v_add_time,w_add_time,U,V,W,nu,tau,sigm,l) 
global add nmr num div beta alpha nmr0 fle form gau;

    [U,V,W]=Large_frame(U,V,W);    
    [u,v,w]=Large_frame(u,v,w);
    [ut,vt,wt]=Large_frame(ut,vt,wt);
    
    [x y z] = size(U);
    
       
         
    [A,D,L]=matrix_loader(x,y,z);
    Z=x*y*z;  
       

     L_E2= speye(3*Z,3*Z)-alpha*nu*L;  
     L_E4= speye(3*Z,3*Z)-beta*L; 
      
        

          
    [u,v,w]=mean_flow(U,V,W);         
    [u,v,w,]=mean_flow1(u,v,w,ut,vt,wt,L_E2,L_E4,U,V,W,tau,sigm,l);

          u_add_time(1:x,1:y,1:z,l+1) = u(1:x,1:y,1:z);
          v_add_time(1:x,1:y,1:z,l+1) = v(1:x,1:y,1:z);
          w_add_time(1:x,1:y,1:z,l+1) = w(1:x,1:y,1:z);



          
     
