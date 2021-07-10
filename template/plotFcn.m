function plotFcn(x,y,phi,phi_a,uc,vc,u_a,v_a,p,strx,stry,ii,io,il,ir)

clevels = 30;
xLim = [-3.25 3.25];
yLim = [-0.25 3.25];
grey=[0.7 0.7 0.7];

% potential contour 
figPotCont = figure(1);
subplot(2,1,1)
contour(x,y,phi,clevels)
xlabel('x'), ylabel('y')
title('phi')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

subplot(2,1,2)
contour(x,y,phi_a,clevels)
xlabel('x'), ylabel('y')
title('phi_a')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

% velocity field 
figVelField = figure(2);
subplot(2,1,1)
quiver(x,y,uc,vc)
xlabel('x'), ylabel('y')
title('velocity field')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

subplot(2,1,2)
quiver(x,y,u_a,v_a)
xlabel('x'), ylabel('y')
title('velocity field analytical')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

% pressure contour
figPreCont = figure(3);
contour(x,y,p,100)
xlabel('x'), ylabel('y')
title('pressure')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

%streamlines
figStrLin = figure(4);
plot(strx,stry,'-o')
xlabel('x'), ylabel('y')
title('streamlines')
xlim(xLim),ylim(yLim)
hold on
plot(x(ii),y(ii),x(io),y(io),x(il),y(il),x(ir),y(ir),'Color',grey)
hold off

%velocity profile @ x = 0
figVelProfil = figure(5);
w = (uc(:,16).^2+vc(:,16).^2).^0.5;
plot(w,y(:,16),'k')
grid on
hold on
quiver(0,y(:,16),w,zeros(31,1),4.448,'k')
hold off
title('velocity profile @ x = 0')
xlabel('w [m/s]'), ylabel('x')

%pressure distribution along cylinder surface
figPreDist = figure(6);
plot(x(ii), p(ii))
title('pressure distribution along cylinder surface')
xlabel('x'), ylabel('p')
grid on
end