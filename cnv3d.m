function [g]=cnv3d(x,y,z,u,v,w)

Z=x*y*z;
g=zeros(1,3*Z);

c= 0;

for k=1:z
for j=1:y
    for i=1:x
        c=c+1;
      g(1,c)=u(i,j,k);
      g(1,c+Z)=v(i,j,k);
      g(1,c+2*Z)=w(i,j,k);
    end 
end
end