function y=find_gear(ua_temp,acc_temp)
load basedata.mat;
global r_tire ratio_main m f ratio cd_wind a_wind ;
range=ones(length(rot_fit),4);
for i=(1:1:4)
    range(:,i)=0.377*rot_fit'*r_tire/ratio_main/ratio(i);
end
% disp(range);
% disp(min(range(:,1)));
for i=(1:1:4)
    if ua_temp>min(range(:,i))&&ua_temp<max(range(:,i))
        rot_efficient=[1+0.05+0.05*ratio(i).^2];
        pe(i)=1/0.85*(m*9.8*f*ua_temp/3600+m*9.8*ratio(i)*ratio_main*ua_temp/3600+cd_wind*a_wind*ua_temp^3/76140+rot_efficient*m*ua_temp/3600*acc_temp*1000/3600);
    else
        pe(i)=-inf;
    end
end

% for i=(1:4)
%     rot_efficient=[1+0.05+0.05*ratio(i).^2];
%     pe(i)=1/0.85*(m*9.8*f*ua_temp/3600+m*9.8*ratio(i)*ratio_main*ua_temp/3600+cd_wind*a_wind*ua_temp^3/76140+rot_efficient*m*ua_temp/3600*acc_temp*1000/3600);
% end
y_temp=find(pe==max(pe));
if length(y_temp)>1
    y=y_temp(1);
else
    y=y_temp;
end