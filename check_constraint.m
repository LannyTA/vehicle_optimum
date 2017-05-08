function y=check_constraint(ratio_temp,ratio_main_temp)
global r_tire torque_fit m f
load basedata.mat
% slope=0.3;
% spd_min=5;
% spd_max=100;
% i_max(1)=0.377*rot_fit(1)*r_tire/spd_min/ratio_main;
% i_max(2)=m*9.8*(f*cosd(17)+sind(17))*r_tire/0.85/ratio_main/max(torque_fit);

flag_1=(ratio_temp(1)>m*9.8*(f*cosd(17)+sind(17))*r_tire/max(torque_fit)/ratio_main_temp/0.85);
flag_2=(0.377*max(rot_fit)*r_tire/ratio_main_temp/ratio_temp(4)>140);
% flag_3=(0.377*min(rot_fit)*r_tire/ratio_main_temp/ratio_temp(1)>5)&&(0.377*min(rot_fit)*r_tire/ratio_main_temp/ratio_temp(1)<10);
y=flag_1&&flag_2;
%disp(i_max);
