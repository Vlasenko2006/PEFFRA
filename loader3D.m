function [u_large,v_large,w_large]=loader3D(num,L_scale,nm)



name = char(4);
name(1:2)=nm(1:2);
name(3)='0';
name(4)='0';

num = num-1;
    if num<=9
        name(4)=int2str(num);
    end
    
    if num>9
        t1=mod(num,10);
        t=(num-mod(num,10))/10;
        name(3)=int2str(t);
        name(4)=int2str(t1);
    end
    



L_scale(4) = int2str(0);
load(['result_3d/Add_',name,L_scale,'.mat'],'u_large','v_large','w_large');
