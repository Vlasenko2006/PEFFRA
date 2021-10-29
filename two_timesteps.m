function [utt,vtt,wtt,uf,vf,wf] = two_timesteps(L)
global add nmr num div beta alpha nmr0 fle form gau ttolerance;

k = 0;
    
for num_loc=nmr0:nmr0+1
    
    if num_loc<=9
        fle(1:2)='00';
        fle(3)=int2str(num_loc);
        name(4)=int2str(num_loc);
        load(['field_3d/',fle,form]);
    end
    
    if num_loc>9
        fle(1)='0';
        t1=mod(num_loc,10);
        t=(num_loc-mod(num_loc,10))/10;
        fle(2)=int2str(t);
        fle(3)=int2str(t1);
        name(3)=int2str(t);
        name(4)=int2str(t1);
        load(['field_3d/',fle,form]);
    end
    
    
   
  [U,V,W]=Large_frame(U,V,W);
  
  
  [u,v,w]=mean_flow_small(U,V,W); 
  [u,v,w]=smoother(u,v,w,U,V,W,L);

    k = k+1;
    


    if num_loc == nmr0  &&  k == 1
       ut = u;
       vt = v;
       wt = w;
    end

    
    if num_loc ==nmr0

        uf = u;
        vf = v;
        wf = w;
    end
    
    
    
    
end

  utt = 2*ut-u;
  vtt = 2*vt-v;  
  wtt = 2*wt-w;
  

  

