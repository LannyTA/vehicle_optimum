function [ y ] = map_fun( x )
global X Y Z i_temp j_temp;
x1=x(1);
y1=x(2);
i_temp=1;
j_temp=1;
for i=(1:1:365)
    for j=(1:1:365)
        if (X(i,j)-x1<14)&&(X(i,j)-x1>0)
            j_temp=j;
        end
    end
    if (Y(i,j)-y1<0.6)&&(Y(i,j)-y1>0)
        i_temp=i;
    end
end
% disp(i_temp);
% disp(j_temp);
y=Z(i_temp,j_temp);

