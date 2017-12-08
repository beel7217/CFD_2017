%% Vortex Panel Methodd
% 0012 
m = 0;
p = 0;
t = 12;
c = 1;
alpha = -20:40;
CL = zeros(1,length(alpha));
figure;
hold on
for i=1:length(alpha)
    [x,y] = build_NACA(m,p,t,c,50);
    [CL(i),gamma,Cp] = Vortex_Panel(x,y,alpha(i));
end
hold off
xlim([0 c]);
txt = sprintf('Coefficient of Pressure vs. x Position Along Chord\nNACA 0012\nalpha = -10 through 15 degrees');
title(txt);

figure;
plot(alpha,CL,'LineWidth',2);
grid on;
txt = sprintf('Sectional Coefficient of Lift vs. Angle of Attack\nNACA 0012');
title('Sectional Coefficient of Lift vs. \alpha for a NACA 0012');
xlabel('\alpha [^o]');
ylabel('Sectional coefficient of lift');
[P,S] = polyfit(alpha*pi/180,CL,1);
alpha_l0_0012 = (-P(2)/P(1))*180/pi;
lift_slope_0012 = P(1);
fprintf('NACA 0012: Lift slope = %1.2f, zero lift angle = %1.2f degrees\n',lift_slope_0012,alpha_l0_0012);
fprintf('Maximum Coefficient of Lift = %1.3f\n',max(CL));