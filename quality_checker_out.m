function  [q,RMS,divergence] = quality_checker(u,v,w,U1,V1,W1,U,V,W)

[u,v,w]=Small_frame(u,v,w);
%[U,V,W]=Small_frame(U,V,W);
[U1,V1,W1]=Small_frame(U1,V1,W1);
     
[x,y,z]=size(U1);

 c = 0;
 Ac = 0;
 RMS = 0;


     for i = 1:x
         for j=1:y
             for k = 1:z
                
                 
                 if U(i,j,k) == 0 & U1(i,j,k)~=0
                 
                 c = c+1;    
                     
                 Ac = Ac + acos((u(i,j,k)*U1(i,j,k)+v(i,j,k)*V1(i,j,k)+w(i,j,k)*W1(i,j,k))/...
                 (sqrt(u(i,j,k)^2+v(i,j,k)^2+w(i,j,k)^2)*sqrt(U1(i,j,k)^2+V1(i,j,k)^2+W1(i,j,k)^2)))*57;
             
                  RMS = RMS + sqrt((u(i,j,k)-U1(i,j,k))^2+(v(i,j,k)-V1(i,j,k))^2+(w(i,j,k)-W1(i,j,k))^2);
             
             
                 end
                 
             end
         end
     end
     
     div = 0;
     
     for i = 2:x-1
         for j=2:y-1
             for k = 2:z-1
                
              div = div + abs(u(i+1,j,k)-u(i-1,j,k) + v(i,j+1,k) - v(i,j-1,k) + w(i,j,k+1)- w(i,j,k-1));    
                              
             end
         end
     end
     
     
     divergence = div/((x-2)*(y-2)*(z-2)*6);
     
     q = Ac/c;
     
     RMS = RMS/c;