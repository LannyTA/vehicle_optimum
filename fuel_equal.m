n_fuel_equal=ua*ratio_main*ratio(gear)/0.377/r_tire;
pe_fuel_equal=(m*9.8*f*ua/3600+cd_wind*a_wind*ua.^3/76140)/0.85;
torque_fuel_equal=9549*pe_fuel_equal/n_fuel_equal;
for i=(1:1:length(Z))
    if X(1,i)-n_fuel_equal>0&&X(1,i)-n_fuel_equal<6
        i_n_output=i;
    end
end

for i=(1:1:length(Z))
    if X(1,i)-torque_fuel_equal>0&&Y(i,1)-n_fuel_equal<0.6
        i_torque_output=i;
    end
end
data_find_map=[n_fuel_equal,torque_fuel_equal];
fuel_cost_unit=map_fun(data_find_map);
fuel_cost_all_equal=fuel_cost_unit*pe_fuel_equal/10/0.75/ua;
