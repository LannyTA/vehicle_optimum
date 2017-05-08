function [ y ] = fuel_muti_equal(fuel_equal_t,fuel_equal_ua)
global m cd_wind a_wind ratio_main r_tire f ratio
ratio_temp=find_gear(fuel_equal_ua,0);
n_fuel_muti_equal=fuel_equal_ua*ratio_main*ratio(ratio_temp)/0.337/r_tire;
pe_fuel_muti_equal=(m*9.8*f*fuel_equal_ua/3600+cd_wind*a_wind*fuel_equal_ua.^3/76140)/0.85;
torque_fuel_muti_equal=9549*pe_fuel_muti_equal/n_fuel_muti_equal;
% for i=(1:1:length(Z))
%     if X(1,i)-n_fuel_muti_equal>0&&X(1,i)-n_fuel_equal<6
%         i_n_muti_output=i;
%     end
% end
% 
% for i=(1:1:length(Z))
%     if X(1,i)-torque_fuel_muti_equal>0&&Y(i,1)-n_fuel_muti_equal<0.6
%         i_torque_muti_output=i;
%     end
% end
data_find_map=[n_fuel_muti_equal,torque_fuel_muti_equal];
fuel_cost_unit=map_fun(data_find_map);
fuel_cost_unit_dt=fuel_cost_unit*pe_fuel_muti_equal/367.1/7;
y=fuel_cost_unit_dt*fuel_equal_t;