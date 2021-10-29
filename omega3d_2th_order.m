function [omegax,omegay,omegaz]= omega3d_2th_order(u,v,w,x,y,z)

global add nmr num div beta alpha nmr0 fle form gau hx hy hz;

omegax = zeros(x,y,z);
omegay = zeros(x,y,z);
omegaz = zeros(x,y,z);


for m=1:z
for i=1:x   %_____________________________!!!!!2,-1 omega= zeros()____1 bok, est' eshe 1
    for j=1:y
        
        
            %  omega x  
     


        if (j>1 & j<y) && (m>1 & m<z)
            
           omegax(i,j,m) = (w(i,j+1,m) - w(i,j-1,m))/(2*hy) -...
                           (v(i,j,m+1) - v(i,j,m-1))/(2*hz);          
        end
        
           
               
    
       if (j==1) && (m>1 & m<z)
           omegax(i,j,m)=(-w(i,j+2,m)+4*w(i,j+1,m)-3*w(i,j,m))/(2*hy)-(v(i,j,m+1)-v(i,j,m-1))/(2*hz);
       end
          
       
       if (j==y) && (m>1 & m<z)
           omegax(i,j,m)=(w(i,j-2,m)-4*w(i,j-1,m)+3*w(i,j,m))/(2*hy)-(v(i,j,m+1)-v(i,j,m-1))/(2*hz); 
       end
       
       if (j>1 & j<y) && (m==1)
           omegax(i,j,m)=(w(i,j+1,m)-w(i,j-1,m))/(2*hy)-(-v(i,j,m+2)+4*v(i,j,m+1)-3*v(i,j,m))/(2*hz); 
       end
       
       if (j>1 & j<y) && (m==z)
           omegax(i,j,m)=(w(i,j+1,m)-w(i,j-1,m))/(2*hy)-(v(i,j,m-2)-4*v(i,j,m-1)+3*v(i,j,m))/(2*hz); 
       end
   
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------



            %  omega y  
     


        if (i>1 & i<y) && (m>1 & m<z)
            
           omegay(i,j,m) = (u(i,j,m+1) - u(i,j,m-1))/(2*hz) -...
                           (w(i+1,j,m) - w(i-1,j,m))/(2*hx);          
        end
        
 
       

      if(i>1 & i<x) && (m==1)
           omegay(i,j,m)=(-u(i,j,m+2)+4*u(i,j,m+1)-3*u(i,j,m))/(2*hz)-(w(i+1,j,m)-w(i-1,j,m))/(2*hx); 
      end   
       
      if(i>1 & i<x) && (m==z)
           omegay(i,j,m)=(u(i,j,m-2)-4*u(i,j,m-1)+3*u(i,j,m))/(2*hz)-(w(i+1,j,m)-w(i-1,j,m))/(2*hx); 
      end    
       
      if(i==1) && (m>1 & m<z)
           omegay(i,j,m)=(u(i,j,m+1)-u(i,j,m-1))/(2*hz)-(-w(i+2,j,m)+4*w(i+1,j,m)-3*w(i,j,m))/(2*hx); 
      end
      
       if(i==x) && (m>1 & m<z)
           omegay(i,j,m)=(u(i,j,m+1)-u(i,j,m-1))/(2*hz)-(w(i-2,j,m)-4*w(i-1,j,m)+3*w(i,j,m))/(2*hx); 
      end

    
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------


        if (i>1 & i<y) && (j>1 & j<y)
            
           omegaz(i,j,m) = (v(i+1,j,m) - v(i-1,j,m))/(2*hx) -...
                           (u(i,j+1,m) - u(i,j-1,m))/(2*hy);          
        end
       


       if(i==1) & (j>1 & j<y)
          omegaz(i,j,m)= (((-v(i+2,j,m)+4*v(i+1,j,m)-3*v(i,j,m))/(2*hx)-(u(i,j+1,m)-u(i,j-1,m))/(2*hy))); 
       end
       
       if(i==x) && (j>1 & j<y)
           omegaz(i,j,m)=(((3*v(i,j,m)-4*v(i-1,j,m)+v(i-2,j,m))/(2*hx)-(u(i,j+1,m)-u(i,j-1,m))/(2*hy)));
       end
       
       if(i>1 & i<x) && (j==1)
          omegaz(i,j,m)=(((v(i+1,j,m)-v(i-1,j,m))/(2*hx)-(-u(i,j+2,m)+4*u(i,j+1,m)-3*u(i,j,m))/(2*hy))); 
       end
          
       if(i>1 & i<x) && (j==y)
           omegaz(i,j,m)=(((v(i+1,j,m)-v(i-1,j,m))/(2*hx)-(3*u(i,j,m)-4*u(i,j-1,m)+u(i,j-2,m))/(2*hy))); 
       end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------





   %_____________________________%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     Korners
          
     
    %  omegaz
            
       if i==1 & j==1 
          omegaz(i,j,m)= (-v(i+2,j,m)+4*v(i+1,j,m)-3*v(i,j,m))/(2*hx)-(-u(i,j+2,m)+4*u(i,j+1,m)-3*u(i,j,m))/(2*hy); 
       end
          
       if i==1 & j==y
          omegaz(i,j,m)= (-v(i+2,j,m)+4*v(i+1,j,m)-3*v(i,j,m))/(2*hx)-(u(i,j-2,m)-4*u(i,j-1,m)+3*u(i,j,m))/(2*hy); 
       end
       
       if i==x && j==1
           omegaz(i,j,m)=(v(i-2,j,m)-4*v(i-1,j,m)+3*v(i,j,m))/(2*hx)-(-u(i,j+2,m)+4*u(i,j+1,m)-3*u(i,j,m))/(2*hy);
       end
       
       if i==x && j==y
           omegaz(i,j,m)=(v(i-2,j,m)-4*v(i-1,j,m)+3*v(i,j,m))/(2*hx)-(u(i,j-2,m)-4*u(i,j-1,m)+3*u(i,j,m))/(2*hy);
       end 
       
       

   %  omega y 
   
     if i==1 & m==1 
        omegay(i,j,m)=(-u(i,j,m+2)+4*u(i,j,m+1)-3*u(i,j,m))/(2*hz)-(-w(i+2,j,m)+4*w(i+1,j,m)-3*w(i,j,m))/(2*hx); 
     end
        
        
      if i==x & m==1
         omegay(i,j,m)=(-u(i,j,m+2)+4*u(i,j,m+1)-3*u(i,j,m))/(2*hz)-(w(i-2,j,m)-4*w(i-1,j,m)+3*w(i,j,m))/(2*hx); 
      end
      
       
      if i==1 & m==z
           omegay(i,j,m)=(u(i,j,m-2)-4*u(i,j,m-1)+3*u(i,j,m))/(2*hz)-(-w(i+2,j,m)+4*w(i+1,j,m)-3*w(i,j,m))/(2*hx); 
      end    
       
      
     if i==x && m==z
           omegay(i,j,m)=(u(i,j,m-2)-4*u(i,j,m-1)+3*u(i,j,m))/(2*hz)-(w(i-2,j,m)-4*w(i-1,j,m)+3*w(i,j,m))/(2*hx); 
      end    
       
      
      
    %  omega x  
     
       if j==1 & m==1
           omegax(i,j,m)=(-w(i,j+2,m)+4*w(i,j+1,m)-3*w(i,j,m))/(2*hy)-(-v(i,j,m+2)+4*v(i,j,m+1)-3*v(i,j,m))/(2*hz); 
       end
       
       if j==y & m==1
           omegax(i,j,m)=(w(i,j-2,m)-4*w(i,j-1,m)+3*w(i,j,m))/(2*hy)-(-v(i,j,m+2)+4*v(i,j,m+1)-3*v(i,j,m))/(2*hz); 
       end
    
       
       if j==1 & m==z
           omegax(i,j,m)=(-w(i,j+2,m)+4*w(i,j+1,m)-3*w(i,j,m))/(2*hy)-(v(i,j,m-2)-4*v(i,j,m-1)+3*v(i,j,m))/(2*hz); 
       end
       
       if j==y & m==z
           omegax(i,j,m)=(w(i,j-2,m)-4*w(i,j-1,m)+3*w(i,j,m))/(2*hy)-(v(i,j,m-2)-4*v(i,j,m-1)+3*v(i,j,m))/(2*hz); 
       end
          
   end
end
end



