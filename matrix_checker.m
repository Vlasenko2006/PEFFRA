clc; clear all; close all



x = 7;
y = 7;
z = 7;

u = zeros(x,y,z);
v = zeros(x,y,z);
w = zeros(x,y,z);
result = zeros(x,y,z);

matrix_test = zeros(x,y,z);

for i = 1:x
    for j = 1:y
        for k = 1:z
            
            u(i,j,k) = i^2;
            
            
        end
    end
end

[L]= Laplace3dl(x,y,z);

g=cnv3d(x,y,z,u,u,u);

R = L*g';

c= 0;

for m=1:z
for j=1:y
    for i=1:x
              c=c+1;
      result(i,j,m)=R(c);

    end 
end
end


for i = 1:x
    for j = 1:y
        for k = 1:z
            
            
            if (i>1 && i<x) & (j>1 && j<y) & (k>1 && k<z)
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-6*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            if i == 1 & (j>1 && j<y) & (k>1 && k<z)
              matrix_test(i,j,k) = 10*u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-5*u(i,j,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            
            if  i == x & (j>1 && j<y) & (k>1 && k<z)
              matrix_test(i,j,k) = u(i,j+1,k)+u(i,j,k+1)-5*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
             if (i>1 && i<x) & j==1  & (k>1 && k<z)
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-5*u(i,j,k)+u(i-1,i,k)+u(i,j,k-1);
             end
            
            if (i>1 && i<x) &  j==y & (k>1 && k<z)
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j,k+1)-5*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            if (i>1 && i<x) & (j>1 && j<y) & k==1
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-5*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k);
            end
            
           if (i>1 && i<x) & (j>1 && j<y) & k==z
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)-5*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
           end

            
           %===============================================================
           %===============================================================
           %===============================================================
           
           
            if i == 1 & j ==1 & (k>1 && k<z)
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-4*u(i,j,k)+u(i,i,k-1);
            end
            
            if i == 1 & j ==y & (k>1 && k<z)
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j,k+1)-4*u(i,j,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            
            if  i == x & j ==1 & (k>1 && k<z)
              matrix_test(i,j,k) = u(i,j+1,k)+u(i,j,k+1)-4*u(i,j,k)+u(i-1,i,k)+u(i,j,k-1);
            end
            
            if  i == x & j==y & (k>1 && k<z)
              matrix_test(i,j,k) = u(i,j,k+1)-4*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            
            
            
             if (i>1 && i<x) & j==1  & k == 1
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-4*u(i,j,k)+u(i-1,i,k);
             end
             
             if (i>1 && i<x) & j==1  & k == z
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)-4*u(i,j,k)+u(i-1,i,k)+u(i,j,k-1);
             end
             
            
            if (i>1 && i<x) &  j==y & k == 1
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j,k+1)-4*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k);
            end
            
            if (i>1 && i<x) &  j==y & k == z
              matrix_test(i,j,k) = u(i+1,i,k)-4*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            
            
            
            
            if i ==1 & (j>1 && j<y) & k == 1
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)+u(i,j,k+1)-4*u(i,j,k)+u(i,j-1,k);
            end
            
            if i ==1 & (j>1 && j<y) & k==z
              matrix_test(i,j,k) = u(i+1,i,k)+u(i,j+1,k)-4*u(i,j,k)+u(i,j-1,k)+u(i,j,k-1);
            end
            
            if i == x & (j>1 && j<y) & k ==1
              matrix_test(i,j,k) = u(i,j+1,k)+u(i,j,k+1)-4*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k);
            end  
            
            if i == x & (j>1 && j<y) & k == z
              matrix_test(i,j,k) = u(i,j+1,k)-4*u(i,j,k)+u(i-1,i,k)+u(i,j-1,k)+u(i,j,k-1);
            end                
           
        end
    end
end
