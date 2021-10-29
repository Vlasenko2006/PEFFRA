clear all; close all; clc

%  The algorithm, suggested below is develped by A.Vlasenko and C. Schnoerr. 
%  For more details, see "Superresolution and Denoising of
%  3D  Fluid Flow Estimates" in Pattern Recognition - 31th DAGM symposium , and
%  Physically Consistent and Efficient Variational Denoising of Image Fluid
%  Flow Esimates.
%
%  This programm processes the corrupted or/and sparse (meaning insufficiet data)
%   velocity vector fields obtained in particle
%  image velocimetry (PIV) and particle tracking velocimetry and returns   
%  the reconstructed dence field with higer resolution (if specified).  
%  The algorithm of this program consists of 4 succsesive
%  steps, based on the main fluid laws. The input parameters are:
%
%  viscosity, amplification parameter, number of iterations, time step,
%  number of fields to be in the process.
%
% level - refining resolution level. Says, how much the grid should be refined
% and can have only integer values. The final grids resolution is proportional
% to 2^level. For instance, Level=0 corresponds to the initial resolution (no refining),
% Level=1 means that a grid should be twice as fine, and Level=2 -> 4 times finer, etc.
%
% nu - viscosity (units in centimeters^2 per second). For water, check
% appropriate conversion table for the experimental value.
%
% mx - maximum value of iterations of the restoration approach on the
% current grid level. I should be also integer. With each mx iteration, the
% skill of the PEFFRA output improves. In future, a criteria will be
% established to automatically determine the necessary value of mx.
%
% nmr - number of input frames that should be restored/ scaled up.
%
% alpha - this is the first 'trust' parameter. If you trust PEFFRA, this
% parameter should be bigger than one, and less than one if not. One is the
% default parameter, it means that you trust PEFFRA equals 50%.
%
% sigm - gaussian variance parameter. The larger sigm is the larger the
% amount of smoothing achieved using the gaussian filtering. You can use
% smoothing to improve the stability of the model if neccessary by increasing
% above the default value of 1.33 (i.e. use in fine tuning). If you decide to
% implement gaussian filtering, the model will take longer to run and may
% result in over-smoothing and loss of interesting flow features! (An
% example of the effect of changing sigma can be trialled on Lenna.jpg). If
% in doubt, complete one run with filtering and one run without filtering and see
% the difference. Sigma should be small as possible to prevent this over smoothing.
%
% beta - this is the second 'trust' parameter. Keep as 1. This is a developmental
% parameter being explored by Andrey Vlasenko.
%
% tau - this is the timestep between frames. In the case the SPTV
% sampling at 25Hz, this is 1/25 = 0.04. This is needed to compute the left
% hand side of the vorticity transport equation.
%
% gau - boolean variable for gaussian filtering on=1 or off=0. (Really
% consider if you need gaussian filtering or not!).
%
% div - boolean variable for divergence removal on=1 or off=0. If it
% possible to use divergence removal do so, but if time is of the essence
% you can turn off completely if necessary or or turn off oly for the higher Levels of
% superresolution (theoretically already divergent free, but in practice some 
% numerical divergance articfacts may be introduced)
%
% Load - boolean variable to load an earlier PEFFRA-output frame to
% continue processing.
%
% nmr0 - if you want to restart a run and continue, enter the number of the next frame to be processed.
% The previous frame (in result_3d directory) will be loaded and the
% processing continues from nmr0 to nmr. Load must obviously be set to 1 to
% use this feature. In case of accumulation of numerical errors in the
% successive calculations, as a last resort, you can stop the run and restart (this time with load=0) to reduce such errors. 


global add nmr num div beta alpha nmr0 fle form gau hx hy hz mx ttolerance noisy_input;

%-------------------------------------------------------------------------
%----------------------------All turnings begin here!----------------------
%-------------------------------------------------------------------------
level = 0;
mx = 15;
nmr = 12;

nu = 0.01;
alpha = .01;
noisy_input = 0;

sigm = .5;
beta = 1;
tau = 1.;
gau = 0;
div = 1;
Load = 0; 
nmr0 = 1;
start_lev = 0;
add = 3;
ttolerance = 0.1;
%-------------------------------------------------------------------------
%----------------------------All turnings end here!-----------------------
%-------------------------------------------------------------------------

m = 2^level;
hx = 1;
hy = 1;
hz = 1;

name=char(4);
fle=char(3);
L_scale = char(4);
L_scale(1)='_';
L_scale(2) = 'S';
L_scale(3) = 'C';
L_scale(4) = '0';
form='.mat';
nm='TL';
name(1:2)=nm(1:2);
name(3)='0';
name(4)='0';
infoM=zeros(mx*nmr,8);
labelx = '';
labely = '';
labelz = '';


error_cheker(start_lev,level,sigm,nu,Load)

c=1; 


a=fopen(['result_3d/info',nm,'.doc'],'w');
fprintf(a,'num l angle deviation RMS\r')
 
for num=nmr0:nmr
    
    if num<=9
        fle(1:2)='00';
        fle(3)=int2str(num);
        name(4)=int2str(num);
        load(['field_3d/',fle,form]);
    end
    
    if num>9
        fle(1)='0';
        t1=mod(num,10);
        t=(num-mod(num,10))/10;
        fle(2)=int2str(t);
        fle(3)=int2str(t1);
        name(3)=int2str(t);
        name(4)=int2str(t1);
        load(['field_3d/',fle,form]);
    end

      
 tic 

    [U,V,W]=Large_frame(U,V,W);
    
    
   
    [x, y, z] = size(U);
   

    
    xi = x;
    yi = y;
    zi = z;

    
 if num ==nmr0   
    
    u_add_time = zeros((x+2*add)*m,(y+2*add)*m,(z+2*add)*m,level+1);
    v_add_time = zeros((x+2*add)*m,(y+2*add)*m,(z+2*add)*m,level+1); 
    w_add_time = zeros((x+2*add)*m,(y+2*add)*m,(z+2*add)*m,level+1);
    
    utt = zeros(x*m,y*m,z*m,level+1);
    vtt = zeros(x*m,y*m,z*m,level+1);
    wtt = zeros(x*m,y*m,z*m,level+1);  
    

end

 
 


 flag_mx = 0;
 t =0;        
 for l=start_lev:level     
     
     [x, y, z] = size(U);
     
     if  Load == 0 && num> nmr0
        ut(1:x,1:y,1:z) = utt(1:x,1:y,1:z,l+1);
        vt(1:x,1:y,1:z) = vtt(1:x,1:y,1:z,l+1);
        wt(1:x,1:y,1:z) = wtt(1:x,1:y,1:z,l+1);   
     end
  
     Z=x*y*z;
     [L]=matrix_loader(x,y,z);
     L_E2= speye(3*Z,3*Z)-alpha*nu*L;  
     L_E4= speye(3*Z,3*Z)-beta*L;


     if  Load == 0 && num == nmr0 && l ==0
         [ut,vt,wt,u,v,w] = first_timestep(L); 
     end
     if  (num ~= nmr0 && l == 0) || Load == 1
          [u,v,w]=mean_flow(U,V,W,L); 
         'Mean flow'
     end

      if  Load == 1 
        [ut,vt,wt]=loader3D(num,L_scale,nm);
        c = 0;
        Load = 0;
      end
     [u,v,w]=denoiser3D_1(u,v,w,ut,vt,wt,L_E2,L_E4,tau,sigm,U,V,W);


      num
      
        
     utt(1:x,1:y,1:z,l+1) = u(1:x,1:y,1:z);
     vtt(1:x,1:y,1:z,l+1) = v(1:x,1:y,1:z);
     wtt(1:x,1:y,1:z,l+1) = w(1:x,1:y,1:z);
        

     

     [q,RMS,divergence] = quality_checker(u,v,w,U,V,W)
     
      fprintf(a,'6%.0f %6.3f %6.3f %6.3f \r',num,l, q, RMS);

     % -------------------------- saver module

      saver3D(u,v,w,U,V,W,name,labelx,labely,l);

toc

     
     if l < level    
         tic
        [u,v,w]=rescaler3D_new(u,v,w);
           if num == nmr0
              [ut,vt,wt]=rescaler3D_new(ut,vt,wt);
           end
        [U,V,W]= injector(U,V,W);
        [U,V,W]=Small_frame(U,V,W);
        'Rescaling finished'
        toc
        
     else
        x = xi;
        y = yi;
        z = zi;
        clear ut vt wt
     end 

 end


end

fclose(a);
