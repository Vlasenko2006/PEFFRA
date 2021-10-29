function [u] = Energy(u,U)

[x y z] = size(u);


index=zeros(x,y,z);

c = 0;
cnull = 0;
Uc = 0;
umc = 0;
M = 0;

for i = 1:x
    for j = 1:y
        for k = 1:z         
            
           if U(i,j,k) ~=0
              Uc = Uc+abs(U(i,j,k));
              c = c +1;
           else
               M = M +abs(u(i,j,k));
               cnull = cnull +1;
           end 
            
        end
    end
end
% c1=0;
% u = u-U;
% 
% for i = 1:x
%     for j = 1:y
%         for k = 1:z         
%             
%            if u(i,j,k) ~=0
%               umc = umc+abs(u(i,j,k));
%               c1 = c1 +1;
%            end 
%             
%         end
%     end
% end


 Uc = Uc/c;
 M = M/cnull;
 %M = umc/c1;
 
 
 %M = mean(mean(mean(abs(u(1:x,1:y,1:z)))));
 
 u = u*Uc/M;
 %u = u + U;
 


         
