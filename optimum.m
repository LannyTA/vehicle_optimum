function y=optimum(ratio_optimum)
global ratio acc_time fuel_cost_all ratio_main;
temp_optimum=ones(40,1);
for i_s=(1:1:40)
    ratio=[ratio_optimum(i_s,1),ratio_optimum(i_s,2),ratio_optimum(i_s,3),ratio_optimum(i_s,4)]';
    ratio_main=ratio_optimum(i_s,5);
    load basedata.mat
    data_store;
    fit_2d;
    fit_3d_2;
    time_acc;
    fuel_calculate;
    q_1=0.7;
    q_2=0.3;
    aim=q_1*10*acc_time+q_2*fuel_cost_all;
    temp_optimum(i_s)=aim;
    flag=check_constraint(ratio,ratio_main);
    if flag==0
        temp_optimum(i_s)=1000;
    end
%     disp(aim);
    disp([temp_optimum(i_s),acc_time,fuel_cost_all]);
    disp([ratio;ratio_main]);
end
y=temp_optimum;