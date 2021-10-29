function [utt,vtt,wtt,uf,vf,wf ]=first_timestep(L)
global add nmr num div beta alpha nmr0 fle form gau;

if num==nmr0 
[utt,vtt,wtt,uf,vf,wf] = two_timesteps(L);

else 
    
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
   

  [U,V,W]=Large_frame(U,V,W);
  %[u,v,w]=Large_frame(u,v,w);
  [uf,vf,wf]=smoother(u,v,w,U,V,W,L);
  
end

[utt] = substitter(utt);
[vtt] = substitter(vtt);
[wtt] = substitter(wtt);

