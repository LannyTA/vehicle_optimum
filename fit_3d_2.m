x=map(:,1);
y=map(:,2);
% global ratio;
z=map(:,3);
xlin = linspace(min(x),max(x),365);
ylin = linspace(min(y),max(y),365);
% xlin=rot_torque_fitdata(:,1);
% ylin=rot_torque_fitdata(:,2);
global X;
global Y;
global Z;
[X,Y]=meshgrid(xlin,ylin);
Z = griddata(x,y,z,X,Y,'cubic');
for i=(1:1:365)
    for j=(1:1:365)
if Y(j,i)>rot_torque_fitdata(i,2)
Y(j,i)=NaN;
Z(j,i)=NaN;
end
    end
end
% mesh(X,Y,Z);hold on
% plot3(x,y,z,'.');
% figure;
% contour(X,Y,Z,[230:20:500],'ShowText','on');hold on;
% plot(rot_torque(:,1),rot_torque(:,2),'r^',rot_fit,torque_fit);
map_rot=[X(1,:)]';
map_torque=Y(:,1);
map_fuel=Z';
