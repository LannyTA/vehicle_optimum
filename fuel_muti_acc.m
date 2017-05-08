function [ y ] = fuel_muti_acc(fuel_acc_t,fuel_acc_ua,fuel_acc_a)
global m cd_wind a_wind ratio_main r_tire f ratio
ua_start=fuel_acc_ua;
ua_end=fuel_acc_ua+fuel_acc_a*fuel_acc_t;
ua_temp=[(ua_start:0.1:ua_end)]';
for j=(1:1:length(ua_temp))
    if ua_temp(j)<10
        ua_temp(j)=10;
    end
    ratio_temp=find_gear(ua_temp(j),fuel_acc_a);
    rot_efficient=[1+0.05+0.05*ratio(ratio_temp).^2];
    pe_temp(j)=1/0.85*(m*9.8*f*ua_temp(j)/3600+cd_wind*a_wind*ua_temp(j)^3/76140+rot_efficient*m*ua_temp(j)/3600*fuel_acc_a*1000/3600);
    n_temp(j)=ua_temp(j)*ratio(ratio_temp)*ratio_main/0.337/r_tire;
    t_temp(j)=9549*pe_temp(j)/n_temp(j);
end
% disp(n_temp);
% calcu_temp=[n_temp,t_temp];
for i=(1:length(ua_temp))
    be_temp(i)=map_fun([n_temp(i);t_temp(i)]);
end
fuel_temp_all=sum(pe_temp'.*be_temp'/367.1/7)*fuel_acc_t/length(ua_temp);
y=fuel_temp_all;