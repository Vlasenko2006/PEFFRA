
function [ex,ey,ez]= VectorE_time_2nd_order_omega(x,y,z,u, v, w, ox,oy,oz,oxt,oyt,ozt,tau)
                                                %(x,y,z,us,vs,ws,ox,oy,oz,oxt,oyt,ozt,tau);

% This function computes the right hand side of vorticity transport
% equation. It is based on the central differnces scheme amd has the second
% order of approximation.

global add nmr num div beta alpha nmr0 fle form gau hx hy hz;

dox= zeros(x,y,z);
doy= zeros(x,y,z);
doz= zeros(x,y,z);

oxx= zeros(x,y,z);
oxy= zeros(x,y,z);
oxz= zeros(x,y,z);
oyx= zeros(x,y,z);
oyy= zeros(x,y,z);
oyz= zeros(x,y,z);
ozx= zeros(x,y,z);
ozy= zeros(x,y,z);
ozz= zeros(x,y,z);


ux= zeros(x,y,z);
uy= zeros(x,y,z);
uz= zeros(x,y,z);
vx= zeros(x,y,z);
vy= zeros(x,y,z);
vz= zeros(x,y,z);
wx= zeros(x,y,z);
wy= zeros(x,y,z);
wz= zeros(x,y,z);



%------------------------------------omega---------------------------------

 




for i=3:x-2
    for j=3:y-2
        for k=3:z-2
            dox(i,j,k)=(ox(i,j,k)-oxt(i,j,k))/tau;
            doy(i,j,k)=(oy(i,j,k)-oyt(i,j,k))/tau;
            doz(i,j,k)=(oz(i,j,k)-ozt(i,j,k))/tau;
        end
    end
end

[dox] = boundary_linear(dox,dox);
[doy] = boundary_linear(doy,doy);
[doz] = boundary_linear(doz,doz);


 for i = 1:2
     
[dox]=interpolate_your_neighbour(dox);
[doy]=interpolate_your_neighbour(doy);
[doz]=interpolate_your_neighbour(doz);


 end

%_______________________________________________Skorosti__________

for i=2:x-1
    for j=2:y-1
        for k=2:z-1

       	    if (i>1 && i<x)
       		        oxx(i,j,k)= (ox(i+1,j,k)-ox(i-1,j,k))/(2*hx);
                    oyx(i,j,k)= (oy(i+1,j,k)-oy(i-1,j,k))/(2*hx);
                    ozx(i,j,k)= (oz(i+1,j,k)-oz(i-1,j,k))/(2*hx);

                    ux(i,j,k)= (u(i+1,j,k)-u(i-1,j,k))/(2*hx);
                    vx(i,j,k)= (v(i+1,j,k)-v(i-1,j,k))/(2*hx);
                    wx(i,j,k)= (w(i+1,j,k)-w(i-1,j,k))/(2*hx);
            end


       	    if (j>1 && j<y)
       		        oxy(i,j,k)= (ox(i,j+1,k)-ox(i,j-1,k))/(2*hy);
                    oyy(i,j,k)= (oy(i,j+1,k)-oy(i,j-1,k))/(2*hy);
                    ozy(i,j,k)= (oz(i,j+1,k)-oz(i,j-1,k))/(2*hy);

                    uy(i,j,k)= (u(i,j+1,k)-u(i,j-1,k))/(2*hy);
                    vy(i,j,k)= (v(i,j+1,k)-v(i,j-1,k))/(2*hy);
                    wy(i,j,k)= (w(i,j+1,k)-w(i,j-1,k))/(2*hy);
            end


       	    if (k>1 && k<z)
       		        oxz(i,j,k)= (ox(i,j,k+1)-ox(i,j,k-1))/(2*hz);
                    oyz(i,j,k)= (oy(i,j,k+1)-oy(i,j,k-1))/(2*hz);
                    ozz(i,j,k)= (oz(i,j,k+1)-oz(i,j,k-1))/(2*hz);

                    uz(i,j,k)= (u(i,j,k+1)-u(i,j,k-1))/(2*hz);
                    vz(i,j,k)= (v(i,j,k+1)-v(i,j,k-1))/(2*hz);
                    wz(i,j,k)= (w(i,j,k+1)-w(i,j,k-1))/(2*hz);
            end

%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

        end
    end
end



%---------------------  Boundaries  --------------------------------------



ex = zeros(x,y,z);
ey = zeros(x,y,z);
ez = zeros(x,y,z);



ex = zeros(x,y,z);
ey = zeros(x,y,z);
ez = zeros(x,y,z);

ex(2:x-1,2:y-1,2:z-1)=  dox(2:x-1,2:y-1,2:z-1);
ey(2:x-1,2:y-1,2:z-1)=  doy(2:x-1,2:y-1,2:z-1);
ez(2:x-1,2:y-1,2:z-1)=  doz(2:x-1,2:y-1,2:z-1);

%----------------------------------------------Vector E

for i=2:x-1
    for j=2:y-1
        for k=2:z-1
            
            unw= u(i,j,k)*oxx(i,j,k) + v(i,j,k)*oxy(i,j,k) +  w(i,j,k)*oxz(i,j,k);
           
            wnu= ox(i,j,k)*ux(i,j,k) + oy(i,j,k)*uy(i,j,k) + oz(i,j,k)*uz(i,j,k);
            
           ex(i,j,k) = ex(i,j,k) - 1*(unw + wnu);

           %--
           vnw= u(i,j,k)*oyx(i,j,k) + v(i,j,k)*oyy(i,j,k) + w(i,j,k)*oyz(i,j,k);
           
           wnv= ox(i,j,k)*vx(i,j,k) + oy(i,j,k)*vy(i,j,k) + oz(i,j,k)*vz(i,j,k);
            
           ey(i,j,k) = ey(i,j,k)+  (vnw- wnv);

           %-----
           dnw= u(i,j,k)*ozx(i,j,k) + v(i,j,k)*ozy(i,j,k) + w(i,j,k)*ozz(i,j,k);
           
           wnd= ox(i,j,k)*wx(i,j,k) + oy(i,j,k)*wy(i,j,k) + oz(i,j,k)*wz(i,j,k);
            
           ez(i,j,k)=  ez(i,j,k)+  (dnw - wnd);

        end
    end
end



