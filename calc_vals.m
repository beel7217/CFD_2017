function [ a0,alphaL0,alpha_stall,cl_max ] = calc_vals(alpha,cl)
    
    %Max coefficient of lift
    [cl_max,max_ind] = max(cl);
    %Stall angle
    alpha_stall = alpha(max_ind);

    %Perform a fit to the linear region
    [P,S] = polyfit(alpha(1:max_ind-5)*pi/180,cl(1:max_ind-5),1);
    %Zero lift angle
    alphaL0 = (-P(2)/P(1))*180/pi;
    %Lift slope
    a0 = P(1);

end

