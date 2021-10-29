function [A]= Laplace3dl(x,y,z)
X=x*y;
Z=x*y*z;

nd=X-x;
sh=-x+1;

%m= x/32*2.858*24

d=[-X,-x,-1,0,1,x,X];

e = ones(Z,1);
A1 = spdiags([e e e -6*e e e e], d, x*y*z, x*y*z);
Ze= sparse(Z,Z);

for k=2:z-1
for i=1:x                    %---------------bc na komponentu z
    
        %Xt=z*y;   
        m=X*(k-1);
        A1(i+m,i+m)=-4;                  
        A1(i+m+nd,i+m+nd)=-4;

        A1(i+m,i+m+x)=0;
        A1(i+m,i+m-x)=0;
        A1(i+m+nd,i+m+nd+x)=0;
        A1(i+m+nd,i+m+nd-x)=0;
        
end        
end

p=0;

for k=1:z
for i=1:y  
    
    Xt=x*y;
p=i*x+(k-1)*Xt;
    A1(p,p)=-4;
    if k<z
    A1(p,p+1)=0;
    A1(p,p-1)=0;
    end
    
    if k>1
    A1(p+sh,p+sh)=-4;
    A1(p+sh,p+sh-1)=0;
    A1(p+sh,p+sh+1)=0;
    end
    
end   
end

sl= Z-X;  % ------------------- bc nignaya i verxnaya krishka

for i=1:X    %-------------------------------------------------------nignaya kriska
    
    A1(i,i)= -2;
    
    if i<x
        A1(i,i+x)=0;
        A1(i,i+X)=0;
    end
    
   if i>x & i<= X-x
   A1(i,i)= -4;
   %A1(i,i-x)= 0;
   A1(i,i+X)= 0;
   end
   
   if i> X-x  %5555555555555 stenka
       A1(i,i+x)=0;
       A1(i,i-x)=0;
       A1(i,i+X)=0;
   end

%--------------------------------------------------- verxnaya krishka
   
   A1(i+sl,i+sl)= -2;
   
   A1(i+sl,i+sl-X)= 0;
   
   if i>x & i< X-x
   A1(i+sl,i+sl)=-4;    
   end
 % A1(i+sl,i+sl-X)= 0;
   
   if sl+i*x<=Z  % y
    A1(i*x+sl,i*x+sl-1)= 0;
   end            %konec ctenki
  
  if i< x  %%555555555 stenka   left
       A1(i+sl,i+sl-x)=0;
       A1(i+sl,i+sl+x)=0;  
   
   end
   
   if i> X-x  %5555555555555 stenka
      %A1(i+sl,i+sl+x)=0;
       A1(i+sl,i+sl-x)=0;
   end
   
end

  %-----------------------------------------------Nignaya krishka

for i=1:y   % Globalnaya stenka
   p=i*x;
   
    A1(p,p)=-2;

    
    if i>1
    A1(p,p-1)=0;
    end
    A1(p,p+1)=0;
    
   % A1(i+X,i+X)=0;
    
    A1(p+sh,p+sh)=-2;  %??????
    if i>1
    A1(p+sh,p+sh-1)=0;
    end
    A1(p+sh,p+sh+1)=0;
    
    
end


% for i=1:x
%    p=i*(y+0)+Z-X;
%    
%     A1(p,p)=-2;
%     if i<x
%     A1(p,p+1)=0;
%     end
%     A1(p+sh,p+sh)=-2;
%     if i>1
%     A1(p+sh,p+sh-1)=0;
%     A1(p+sh,p+sh+1)=0;
%     end
%     
% end



if k==z

for i=1:y
   
    cnt=(Z-X)+(i-1)*x;
    
    A1(cnt,cnt)=-2; %%%%%%%niz
    if i<y
    A1(cnt,cnt+1)=0;
    A1(cnt,cnt-1)=0;
    A1(cnt+x+1,cnt+x+1)=-2;
    end
    
end
A1(Z-x,Z-x)=-2;
A1(Z-x,Z-x+1)=0;
A1(Z-x,Z-x-1)=0;

end











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  UGLI  %%%%%%%%

nd=X-x;
sh=-x+1;

for k=1:z
    s=X*(k-1)+1;    %-----------levii ugol
    A1(s,s)=-2;
    if s+1<Z
    A1(s,s+1)=0;
    end
    if s+x<Z
    A1(s,s+x)=0;
    end
    if k<z
    A1(s,s+X)=1;
    end
    if k>1
        A1(s,s-X)=1;
    end
%     
    s=s-1;   %-------------------------pravii ugol
    if s+x<=Z
    A1(s+x,s+x)=-2;
    A1(s+x,s+x-1)=0;
    end
    if s+x+1<=Z
    A1(s+x,s+x+1)=0;
    A1(s+x,s+1)=0;
    %A1(s+x,s+1)=0;
    end
    if s+2*x<=Z
    A1(s+x,s+2*x)=0;
    end
    if s+x+X<=Z
    A1(s+x,s+X+x)=1; 
    end
    
    if s>0
        A1(s+x,s)=0;
    end
    
    if s+x<=Z & s-X+x>0
    A1(s+x,s-X+x)=1; 
    end
  %%%%%%%%%%%%%%%%%%%%%%%%%%%!!!!  
    lv=X*k-x+1;   %---------------------- levii verxnii
    if lv<=Z
    A1(lv,lv)=-2;
    A1(lv,lv-1)=0;
    A1(lv,lv-x)=0;
    if k>1
    A1(lv,lv-X)=1;
    end
    end
    if lv+1<Z
    A1(lv,lv+1)=0;
    end
    if lv+x<Z
    A1(lv,lv+x)=0;
    end
    if lv+X<Z
    A1(lv,lv+X)=1;
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    
    sl=X*k;    %-----------pravii verhnii
    A1(sl,sl)=-2;
    if sl+1<=Z
    A1(sl,sl+1)=0;
    end
    if sl+x<=Z
    A1(sl,sl+x)=0;
    end
    if sl+X<=Z
    A1(sl,sl+X)=1;
    end
    if sl-x<=Z & sl-X>0
        A1(sl,sl-X)=1;
    end
    
    A1(sl,sl-1)=0;
    A1(sl,sl-x)=0;
    if k>1
    A1(sl,sl-X)=1;
    end    
    
    
end
 
A1(1,1) =0;  %------------ levii verx nizgnaya krishka
A1(1,X+1) =0;

A1(Z-X+1,Z-X+1) =0; %------------ levii niz verxnyaya krishka
A1(Z-X+1,Z-2*X+1) =0;
     
A1(x,x) = 0;  %------------  levii niz nignyaya krishka
A1(x,x+X) = 0;

A1(Z-X+x,Z-2*X+x) =0;  %------------  levii niz verxnyaya krishka
A1(Z-X+x,Z-X+x) =0;   
    
A1(X-x+1,X-x+1)=0;  %------------  pravii verx nignyaya krishka
A1(X-x+1,2*X-x+1)=0;
    

A1(Z-x+1,Z-x+1)=0;  %------------  pravii verx verxnyaya krishka
A1(Z-x+1,Z-X-x+1)=0;

A1(X,X)=0;   % ------- pravii nignii ugol, nignyaya krishka
A1(X,2*X)=0;    

A1(Z,Z)=0;   % ------- pravii nignii ugol, nignyaya krishka
A1(Z,Z-X)=0;  

A=[A1,Ze,Ze;Ze,A1,Ze;Ze,Ze,A1];