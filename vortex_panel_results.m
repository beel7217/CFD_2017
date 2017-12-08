function [CL,a0,alpha_L0,Cl_max] = vortex_panel_results(m,p,t,alpha)

    %Calculate coefficient of lift using vortex panel method
    CL = zeros(length(alpha),1);
    [x,y] = build_NACA(m,p,t,1,50);
    for i=1:length(alpha)
        [CL(i),gamma,Cp] = Vortex_Panel(x,y,alpha(i));
    end
    
    %Perform line of best fit
    [P,S] = polyfit(alpha*pi/180,CL,1);
    %Zero lift angle
    alpha_L0 = (-P(2)/P(1))*180/pi;
    %Lift slope
    a0 = P(1);
    %Max Cl
    Cl_max = max(CL);

end

