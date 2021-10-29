function [u]=Gauss3D_matrix(sigm,u)
 [x, y, z]=size(u);


d=8;
d1=d/2;

X=x+2*d1;
Y=y+2*d1;
Z=z+2*d1;


[un]=Large_frame_gauss(u,d);


f = zeros(d,d,d);


for i=1:d
    for j=1:d
        for k=1:d
            f(i,j,k)=(1/(2*pi*sigm)^(3/2))*exp((-(i-0.5*d)^2-(j-0.5*d)^2-(k-0.5*d)^2)/(2*sigm));
        end
    end
end



for i=1:X-d
    for j=1:Y-d
        for k=1:Z-d
        u(i,j,k) =sum(sum(sum(un(i+1+d1:i+d+d1, j+1+d1:j+d+d1, k+1+d1:k+d+d1).*f(:,:,:))));     
        end
    end
end




