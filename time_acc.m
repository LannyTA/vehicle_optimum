global ua;
global ratio_main;
global ratio;
global r_tire;
global m;
global cd_wind;
global a_wind acc_time;
load basedata.mat;
for i=(1:length(ratio))
    Ft(:,i)=rot_torque_fitdata(:,2)*ratio(i)*ratio_main*0.85/r_tire;
    ua(:,i)=0.377*rot_torque_fitdata(:,1)*r_tire/ratio_main/ratio(i);
    Fw(:,i)=cd_wind*a_wind*ua(:,i).^2/21.15;
    Ff=m*9.8*f;
    acc(:,i)=(Ft(:,i)-Ff-Fw(:,i))/m/rot_efficient(i);
    F_resist=Ff+Fw;
end
acc_trans=1./acc;
% figure;hold on;
% for k=(1:length(ratio))
%     plot(ua(:,k),Ft(:,k),ua(:,k),F_resist(:,k));
% end

% figure;hold on;
% for k=(1:length(ratio))
%     hold on;
%     plot(ua(:,k)/3.6,acc_trans(:,k));
% end
% axis([0 30 0 5]);
% xlabel('车速（m/s）');
% ylabel('加速度倒数')


for q=(1:length(ratio))
    data_acc((1+365*(q-1)):1:365*q,1)=ua(:,q)/3.6;
    data_acc((1+365*(q-1)):1:365*q,2)=acc_trans(:,q);
end

data_acc_1=polyfit(data_acc(1:1:365,1),data_acc(1:1:365,2),4);
data_acc_2=polyfit(data_acc(1+1*365:1:365*2,1),data_acc(1+1*365:1:365*2,2),4);
data_acc_3=polyfit(data_acc(1+2*365:1:365*3,1),data_acc(1+2*365:1:365*3,2),4);
data_acc_4=polyfit(data_acc(1+3*365:1:365*4,1),data_acc(1+3*365:1:365*4,2),4);
% figure;hold on;
% plot(data_acc(1:1:365,1),polyval(data_acc_1,data_acc(1:1:365,1)));
% plot(data_acc(1+1*365:1:365*2,1),polyval(data_acc_2,data_acc(1+1*365:1:365*2,1)));
% plot(data_acc(1+2*365:1:365*3,1),polyval(data_acc_3,data_acc(1+2*365:1:365*3,1)));
% plot(data_acc(1+3*365:1:365*4,1),polyval(data_acc_4,data_acc(1+3*365:1:365*4,1)));

m1=(data_acc(1+365*(1-1)):0.1:data_acc(365*1));
m2=(data_acc(1+365*(2-1)):0.1:data_acc(365*2));
m3=(data_acc(1+365*(3-1)):0.1:data_acc(365*3));
m4=(data_acc(1+365*(4-1)):0.1:data_acc(365*4));

i=1;
ua_min=0.377*min(rot_fit)*r_tire/ratio_main/ratio(1);
for q=(ua_min:0.1:100/3.6)
    if q>min(m1)&&q<max(m1)
        data_m1(i)=polyval(data_acc_1,q);
        i=i+1;
    else
        data_m1(i)=inf;
        i=i+1;
    end
end

i=1;
for q=(ua_min:0.1:100/3.6)
    if q>min(m2)&&q<max(m2)
        data_m2(i)=polyval(data_acc_2,q);
        i=i+1;
    else
        data_m2(i)=inf;
        i=i+1;
    end
end

i=1;
for q=(ua_min:0.1:100/3.6)
    if q>min(m3)&&q<max(m3)
        data_m3(i)=polyval(data_acc_3,q);
        i=i+1;
    else
        data_m3(i)=inf;
        i=i+1;
    end
end
i=1;
for q=(ua_min:0.1:100/3.6)
    if q>min(m4)&&q<max(m4)
        data_m4(i)=polyval(data_acc_4,q);
        i=i+1;
    else
        data_m4(i)=inf;
        i=i+1;
    end
end
q=(ua_min:0.1:100/3.6);
% q=(12/3.6:0.1:100/3.6);
for n=(1:1:length(q))
    acc_vers(n)=min([data_m1(n),data_m2(n),data_m3(n),data_m4(n)]);
    if acc_vers(n)<0
        acc_vers(n)=inf;
    end
end

acc_time=0.1*sum(acc_vers);
% if acc_time<0
%     acc_time=inf;
% end