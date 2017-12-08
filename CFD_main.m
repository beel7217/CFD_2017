clear all
close all
clc

%% Import data
[alpha_0012,cd_0012,cl_0012] = readfile('0012_tracking_old');
[alpha_4412,cd_4412,cl_4412] = readfile('4412_tracking_old');
exp_data_cl_0012 = csvread('cl_0012_experimental.csv');
exp_data_clvscd_0012 = csvread('clvscd_0012_experimental.csv');
exp_data_cl_4412 = csvread('cl_4412_experimental.csv');
exp_data_clvscd_4412 = csvread('clvscd_4412_experimental.csv');
%% Analysis
% 0012
% CFD
[a0_0012,alphaL0_0012,alpha_stall_0012,cl_max_0012] = calc_vals(alpha_0012,cl_0012);
% Experimental data
[exp_a0_0012,exp_alphaL0_0012,exp_alpha_stall_0012,exp_cl_max_0012] =...
                    calc_vals(exp_data_cl_0012(:,1),exp_data_cl_0012(:,2));
% Vortex Panel Method
set(0,'DefaultFigureVisible','off')
[vp_cl_0012,vp_a0_0012,vp_L0_0012,vp_mcl_0012] = vortex_panel_results(0,0,12,alpha_0012);
set(0,'DefaultFigureVisible','on')

% 4412
% CFD
[a0_4412,alphaL0_4412,alpha_stall_4412,cl_max_4412] = calc_vals(alpha_4412,cl_4412);
% Experimental data
[exp_a0_4412,exp_alphaL0_4412,exp_alpha_stall_4412,exp_cl_max_4412] =...
                    calc_vals(exp_data_cl_4412(:,1),exp_data_cl_4412(:,2));
% Vortex Panel Method
set(0,'DefaultFigureVisible','off')
[vp_cl_4412,vp_a0_4412,vp_L0_4412,vp_mcl_4412] = vortex_panel_results(4,4,12,alpha_4412);
set(0,'DefaultFigureVisible','on')

%% Plot
% 0012
% cl
figure;
hold on
scatter(exp_data_cl_0012(:,1),exp_data_cl_0012(:,2),'d','LineWidth',2);
scatter(alpha_0012,cl_0012,'LineWidth',2);
plot(alpha_0012,vp_cl_0012,'LineWidth',2);
grid on
xlabel('Angle of Attack [^o]');
ylabel('C_l');
title('C_l vs. AoA for NACA 0012 at Re = 6E06')
legend('Experimental','CFD','Vortex Panel Method','Location','NorthWest');
hold off

% cd
figure;
hold on
scatter(exp_data_clvscd_0012(:,1),exp_data_clvscd_0012(:,2),'d','LineWidth',2);
scatter(cl_0012,cd_0012,'LineWidth',2);
grid on
xlabel('C_l');
ylabel('C_d');
title('C_l vs. C_d for NACA 0012 at Re = 6E06')
legend('Experimental','CFD','Location','NorthWest');
hold off

% 4412
% cl
figure;
hold on
scatter(exp_data_cl_4412(:,1),exp_data_cl_4412(:,2),'d','LineWidth',2);
scatter(alpha_4412,cl_4412,'LineWidth',2);
plot(alpha_4412,vp_cl_4412,'LineWidth',2);
grid on
xlabel('Angle of Attack [^o]');
ylabel('C_l');
title('C_l vs. AoA for NACA 4412 at Re = 3E06')
legend('Experimental','CFD','Vortex Panel Method','Location','NorthWest');
hold off

% cd
figure;
hold on
scatter(exp_data_clvscd_4412(:,1),exp_data_clvscd_4412(:,2),'d','LineWidth',2);
scatter(cl_4412,cd_4412,'LineWidth',2);
grid on
xlabel('C_l');
ylabel('C_d');
title('C_l vs. C_d for NACA 4412 at Re = 3E06')
legend('Experimental','CFD','Location','NorthWest');
hold off






