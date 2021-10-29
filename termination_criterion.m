function [f,Mean_angle_deviation,it]=termination_criterion(u,v,w,u_pr,v_pr,w_pr,it,Previous_mean_angle_deviation,f)
                                                 
global mx ttolerance;



     [x,y,z]=size(u);

      U=sum(sum(sum(abs(u-u_pr))))/sum(sum(sum(abs(u))));
      V=sum(sum(sum(abs(v-v_pr))))/sum(sum(sum(abs(v))));
      W=sum(sum(sum(abs(w-w_pr))))/sum(sum(sum(abs(w))));
      

    Ac = 0.0;
    Mean_angle_deviation = 0;
    
     for i = 3:x-2
         for j=3:y-2
             for k = 3:z-2

              
                  Ac = Ac + acos(( u(i,j,k)*u_pr(i,j,k) + v(i,j,k)*v_pr(i,j,k) + w(i,j,k)*w_pr(i,j,k) )/...
                  (sqrt(u(i,j,k)^2 + v(i,j,k)^2 + w(i,j,k)^2)*sqrt(u_pr(i,j,k)^2 + v_pr(i,j,k)^2 + w_pr(i,j,k)^2)))*57;
       
                 
             end
         end
     end
     
     Mean_angle_deviation = real(Ac/((x-2)*(y-2)*(z-2)));
      

  
if  ((1 - Mean_angle_deviation/Previous_mean_angle_deviation)< ttolerance ) || (it == mx) || (Mean_angle_deviation <= 0.1)
    
    if f == 1
      f = 2;
    else
      f = 1;
    end
    
    Mean_angle_deviation = 360;
    
    if it == mx 
        warning('Something is wrong. Algorithm has either exploded or converge too slowly')
    end
    


end




it = it+1
           