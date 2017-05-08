global ratio;
rot_torque(:,1)=[128.8 190.7 249 310.5 338.7 366.9 433.9 471.8 510.5]'*60/2/3.14.*[linspace(1,1.5,9)]';
rot_torque(:,2)=[67.8 122.0 187.1 214.2 214.2 214.2 216.9 199.3 199.3]';

for i=(1:1:9)
map(15*(i-1)+1:1:15*i,1)=rot_torque(i,1)*ones(15,1);
end

for i=(1:1:9)
map(15*(i-1)+1:1:15*i,2)=[27.1 40.6 54.2 67.7 81.3 94.8 108.4 122 135.5 149.1 162.6 176.2 ...
189.7 203.3 216.9]';
end

fuel= [
436.14	421.94	407.74	393.54	393.54	393.54	393.54	393.54	393.54	393.54	393.54	393.54	393.54	393.54	393.54
400.86	386.66	372.46	358.26	344.07	329.87	315.67	301.47	301.47	301.47	301.47	301.47	301.47	301.47	301.47
363.32	363.32	352.92	347.72	342.52	332.13	326.93	321.73	311.33	306.13	300.93	288.46	288.46	288.46	288.46
384.94	384.94	384.94	368.08	351.22	337.93	333.63	329.33	323.58	321.79	320   	319.91	319.83	401.06	401.06
395.25	395.25	395.25	370.95	346.65	325.11	319.32	313.54	311.03	314.14	317.25	328.48	339.71	412.22	412.22
405.56	405.56	405.56	373.82	342.08	312.28	305.02	297.75	298.49	306.49	314.5 	337.04	359.59	423.38	423.38
406.85	406.85	406.85	394.57	382.3	371.68	369.71	367.74	370.48	375.2  	379.91	391.39	402.87	420.29	437.71
592.04	592.04	554.46	516.87	460.66	442.04	423.41	413.32	403.23	410.21	423.18	436.14	488.45	488.45	488.45
731.92	731.92	572.15	539.11	506.07	477.45	472.51	467.57	468.93	470.29	476.89	483.5 	483.5 	483.5 	483.5];
for i=(1:1:9)
for j=(1:1:15)
map(j+(i-1)*15,3)=fuel(i,j);
end
end
global ua;
% global ratio_main;
global r_tire;
global m;
global cd_wind;
global a_wind;
% global ratio;
% ratio=[3.84,2.57,1.6,1]';
% global ratio_main
% ratio_main=4.67;
%global r_tire;
r_tire=0.34295;
Ft=ones(365,4);
%global ua
ua=ones(365,4);
Fw=ones(365,4);
acc=ones(365,4);
%global a_wind;
a_wind=3.4;
%global cd_wind;
cd_wind=0.42;
%global m;
m=1985;
global f;
f=0.018;
efficient=0.85;
rot_efficient=[1+0.05+0.05*ratio.^2];