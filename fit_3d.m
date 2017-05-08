 [x,y,z]=prepareSurfaceData(map(:,1),map(:,2),map(:,3)); ft = fittype( 'poly55' );
opts = fitoptions( ft ); opts.Normalize = 'on';
[sf, gof] = fit([x, y], z, ft, opts);
figure( 'Name', 'Engine' );
subplot( 2, 1, 1 ); h = plot( sf, [x, y], z ); grid on
legend( h, 'Engine', 'be vs. ne, Me' ); xlabel('ne');ylabel('Me');zlabel('be');
subplot( 2, 1, 2 ); grid on; h=plot(sf,[x,y],z,'Style','Contour');
legend(h, 'Engine', 'be vs. ne, Me');xlabel('ne');ylabel('Me');