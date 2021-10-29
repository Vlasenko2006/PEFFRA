function []=saver3D(u,v,w,U,V,W,name,labelx,labely,l)

% Saves your results


u_large = u;
v_large = v; 
w_large = w;

[u,v,w]=Small_frame(u,v,w);
[U,V,W]=Small_frame(U,V,W);

[x, y, z] = size(u);

ck=1.5;

mdl = (x-mod(x-1,2)+1)/2;


[X,Y] = meshgrid(1:x,1:x);
   
   

u2dx=zeros(x,y);
w2dx=zeros(x,y);

v2dy=zeros(x,y);
w2dy=zeros(x,y);

u2dz=zeros(x,y);
v2dz=zeros(x,y);

uix=zeros(x,y);
wix=zeros(x,y);

viy=zeros(x,y);
wiy=zeros(x,y);

uiz=zeros(x,y);
viz=zeros(x,y);



L_scale = char(4);
L_scale(1)='_';
L_scale(2) = 'S';
L_scale(3) = 'C';


L_scale(4) = int2str(l);
   
for i= 1:x
    for j=1:y
        
        u2dx(i,j)=u(mdl,i,j);
        w2dx(i,j)=w(mdl,i,j);

        v2dy(i,j)=v(i,mdl,j);
        w2dy(i,j)=w(i,mdl,j);

        
        u2dz(i,j)=u(i,j,mdl);
        v2dz(i,j)=v(i,j,mdl);
        

    end 
end

   
for i= 1:x
    for j=1:y
        
        uix(i,j)=U(mdl,i,j);
        wix(i,j)=W(mdl,i,j);

        viy(i,j)=V(i,mdl,j);
        wiy(i,j)=W(i,mdl,j);

        
        uiz(i,j)=U(i,j,mdl);
        viz(i,j)=V(i,j,mdl);
        

    end 
end


save(['result_3d/',name,L_scale,'.mat'],'u','v','w'); %----- saves u,v and w 

save(['result_3d/Add_',name,L_scale,'.mat'],'u_large','v_large','w_large'); %----- saves u,v and w 


h=1;
hold on
   title(['Restored U and W velocyty profile in a verical slice x = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,w2dx,u2dx,2*ck,'k');
   h4=quiver(X,Y,wix,uix,2*ck,'r');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Overlapped_Restored_U_W_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.fig']);
close(h);




h=1;
hold on
   title(['Restored U and W velocyty profile in a verical slice x = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,w2dx,u2dx,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
close(h);




%===========================================================================

h=1;
hold on
   title(['Restored V and W velocyty profile in a verical slice y = const. ' ])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,v2dy,w2dy,2*ck,'k');
   h4=quiver(X,Y,viy,wiy,2*ck,'r');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Overlapped_Restored_V_W_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.fig']);
close(h);

h=1;
hold on
   title(['Restored V and W velocyty profile in a verical slice y = const. ' ])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,v2dy,w2dy,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
close(h);



%===========================================================================

h=1;
hold on
   title(['Restored U and V velocyty profile in a horizontal slice z = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,u2dz,v2dz,2*ck,'k');
   h4=quiver(X,Y,uiz,viz,2*ck,'r');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Restored_U_V_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Overlapped_Restored_U_V_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Restored_U_V_profile',name,L_scale,'.fig']);
close(h);





h=1;
hold on
   title(['Restored U and W velocyty profile in a verical slice x = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,w2dx,u2dx,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.jpg']); 
saveas(h,['result_3d/Restored_U_W_profile',name,L_scale,'.fig']);
close(h);


%===========================================================================

h=1;
hold on
   title(['Restored V and W velocyty profile in a verical slice y = const. ' ])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,v2dy,w2dy,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.jpg']); 
saveas(h,['result_3d/Restored_V_W_profile',name,L_scale,'.fig']);
close(h);


%===========================================================================

h=1;
hold on
   title(['Restored U and V velocyty profile in a horizontal slice z = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,u2dz,v2dz,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


saveas(h,['result_3d/Restored_U_V_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
saveas(h,['result_3d/Restored_U_V_profile',name,L_scale,'.jpg']); 
saveas(h,['result_3d/Restored_U_V_profile',name,L_scale,'.fig']);
close(h);






% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3 D Fields %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




 [X,Y,Z] = meshgrid(1:x,1:y,1:z);
  [omegax,omegay,omegaz,cav]= curl(X,Y,Z,u,v,w);
 
 
 %g1=cnv3d(x,y,z,omegax,omegay,omegaz); 
   c=0;
   
  ox=zeros(1,1,x*y*z);
  oy=zeros(1,1,x*y*z);
  oz=zeros(1,1,x*y*z);
  oma=zeros(x,y,z);
  iso=0;
for i=1:x
    for j=1:y
        for n=1:z
            c=c+1;
            ox(1,1,c)=omegax(i,j,n);
            oy(c)=omegay(i,j,n);
            oz(c)=omegaz(i,j,n);
            oma(i,j,n)=sqrt(omegax(i,j,n)^2+omegay(i,j,n)^2+omegaz(i,j,n)^2);
            iso=iso+oma(i,j,n);
        end
    end
end

iso=iso/(x*y*z);
  

 [X,Y,Z] = meshgrid(1:x,1:y,1:z);


 
 title(' Isosurface of mean vorticity of the restored flow')
 xlabel('')
 ylabel('')
 %XTicnLabel(0)
 set(gca,'XTickLabel',{})
 set(gca,'YTickLabel',{})
 set(gca,'XTick',[])
 set(gca,'YTick',[])
 set(gca,'ZTick',[])

%    camroll([45,45,45])
view(30,30)
fv = patch(isosurface(X,Y,Z,oma,iso));
isonormals(oma,fv);
set(fv,'FaceColor','red','EdgeColor','none');
daspect([1 1 1])
view(3);
%axis tight
axis([0 x 0 y 0 z]);
 h=gcf;
   
camlight

%saveas(h,['result_3d/Restored_vorticity',name,L_scale,'.eps']); %0------------------------------------------save Curl denoised fig
%saveas(h,['result_3d/Restored_vorticity',name,L_scale,'.fig']); %0------------------------------------------save Curl denoised fig
saveas(h,['result_3d/Restored_vorticity',name,L_scale,'.jpg']); %0------------------------------------------save Curl denoised fig
close(h)
     







%555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555






save(['result_3d/',name,L_scale,'.mat'],'u','v','w');      %----- saves u,v and w 




h=1;
hold on
   title(['Initial U and W velocyty profile in a verical slice x = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,wix,uix,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
 %  rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Initial_U_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
%saveas(h,['result_3d/Initial_U_W_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Initial_U_W_profile',name,L_scale,'.fig']);
close(h);


%===========================================================================

h=1;
hold on
   title(['Initial V and W velocyty profile in a verical slice y = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,viy,wiy,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Initial_V_W_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
%saveas(h,['result_3d/Initial_V_W_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Initial_V_W_profile',name,L_scale,'.fig']);
close(h);


%===========================================================================

h=1;
hold on
   title(['Initial U and V velocyty profile in a horizontal slice z = const. '])
    set(gca,'XTickLabel',{})
   set(gca,'YTickLabel',{})
   set(gca,'XTick',[])
   set(gca,'YTick',[])
   xlabel([labelx])
   ylabel([labely])
   h3=quiver(X,Y,uiz,viz,2*ck,'k');
   daspect([1,1,1])
   axis([0 x 0 y]);
   ha=gca;
   box(ha);
%   rotate([h1,h2,h3],[0,0,1],270)
   h=gcf;
hold off


%saveas(h,['result_3d/Initial_U_V_profile',name,L_scale,'.eps']);  %------------ Three vectorfields
%saveas(h,['result_3d/Initial_U_V_profile',name,L_scale,'.jpg']); 
%saveas(h,['result_3d/Initial_U_V_profile',name,L_scale,'.fig']);
close(h);




% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3 D Fields %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




 [X,Y,Z] = meshgrid(1:x,1:y,1:z);
  [omegax,omegay,omegaz,cav]= curl(X,Y,Z,U,V,W);
 
 
 %g1=cnv3d(x,y,z,omegax,omegay,omegaz); 
   c=0;
   
  ox=zeros(1,1,x*y*z);
  oy=zeros(1,1,x*y*z);
  oz=zeros(1,1,x*y*z);
  oma=zeros(x,y,z);
  iso=0;
for i=1:x
    for j=1:y
        for n=1:z
            c=c+1;
            ox(1,1,c)=omegax(i,j,n);
            oy(c)=omegay(i,j,n);
            oz(c)=omegaz(i,j,n);
            oma(i,j,n)=sqrt(omegax(i,j,n)^2+omegay(i,j,n)^2+omegaz(i,j,n)^2);
            iso=iso+oma(i,j,n);
        end
    end
end

iso=iso/(x*y*z);
  

 [X,Y,Z] = meshgrid(1:x,1:y,1:z);


 
 title(' Isosurface of mean vorticity of the initial flow')
 xlabel('')
 ylabel('')
 %XTicnLabel(0)
 set(gca,'XTickLabel',{})
 set(gca,'YTickLabel',{})
 set(gca,'XTick',[])
 set(gca,'YTick',[])
 set(gca,'ZTick',[])

%    camroll([45,45,45])
view(30,30)
fv = patch(isosurface(X,Y,Z,oma,iso));
isonormals(oma,fv);
set(fv,'FaceColor','red','EdgeColor','none');
daspect([1 1 1])
view(3);
%axis tight
axis([0 x 0 y 0 z]);
 h=gcf;
   
camlight

%saveas(h,['result_3d/Initial_vorticity',name,L_scale,'.eps']); %0------------------------------------------save Curl denoised fig
%saveas(h,['result_3d/Initial_vorticity',name,L_scale,'.fig']); %0------------------------------------------save Curl denoised fig
%saveas(h,['result_3d/Initial_vorticity',name,L_scale,'.jpg']); %0------------------------------------------save Curl denoised fig
close(h)
   





















%%





     
%   pcolor(X,Y,cav); 
%   shading interp
%  Z=abs(u(:,:))+abs(v(:,:));
%   c=max(max(Z))
%  Z=Z*x/c;
% 
%  hold on
% image(Z)
% colormap(jet)
% hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  letter 'M' means mixed

% name

%  2 first letters - abbriviation of the flow type
%  3,4-file number
%  5th - iteration number
%  6-th letter: G-groundtrouth, N- noisy, D- denoised, T three vectorfields 


