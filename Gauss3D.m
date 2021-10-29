function [ub]=Gauss3D(sigm,u)
 [x, y, z]=size(u);


d=8;
d1=8;

X=x+2*d1;
Y=y+2*d1;
Z=z+2*d1;


[un]=Large_frame_gauss(u,d);





for i=1:d
    for j=1:d
        for k=1:d
            f(i,j,k)=(1/(2*pi*sigm)^(3/2))*exp((-(i-0.5*d)^2-(j-0.5*d)^2-(k-0.5*d)^2)/(2*sigm));
        end
    end
end


for i=1:X-d1
    for j=1:Y-d1
        for k=1:Z-d1
 c=0;               
 for l=1:d
    for m=1:d
        for n=1:d
            c=c+un(i+l,j+m,k+n)*f(l,m,n);
        end
    end
end
       uf(i,j,k)=c;       
        end
    end
end

ub=zeros(x,x,x);

d1=d/2;
for i=1:x
    for j=1:y
        for k=1:z
        ub(i,j,k)=uf(d1+i,d1+j,d1+k);  
        end
    end
end





% a=[1,2,3,4;5,6,7,8];
% d=full(spdiags(a));


