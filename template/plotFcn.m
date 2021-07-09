function plotFcn(x,y,phi,phi_a,uc,vc,u_a,v_a,p,strx,stry)
% potential contour 
figPotCont = figure(1);
clevels = 30;

subplot(2,1,1)
contour(x,y,phi,clevels)
xlabel('X'), ylabel('Y')
title('phi')

subplot(2,1,2)
contour(x,y,phi_a,clevels)
xlabel('X'), ylabel('Y')
title('phi_a')

% velocity field 
figVelField = figure(2);
subplot(2,1,1)
quiver(x,y,uc,vc)
xlabel('X'), ylabel('Y')
title('velocity field')

subplot(2,1,2)
quiver(x,y,u_a,v_a)
xlabel('X'), ylabel('Y')
title('velocity field analytical')

% pressure contour
figPreCont = figure(3);
contour(x,y,p,100)
xlabel('X'), ylabel('Y')
title('pressure')

%streamlines
figStrLin = figure(4);
plot(strx,stry,'-o')
xlabel('X'), ylabel('Y')
title('streamlines')

%velocity profile @ x = 0
figVelProfil = figure(5);
w = (uc(:,16).^2+vc(:,16).^2).^0.5;
plot(w,y(:,16),'k')
grid on
hold on
quiver(0,y(:,16),w,zeros(31,1),4.448,'k')
hold off
title('velocity profile @ x = 0')
xlabel('w [m/s]'), ylabel('Y')
end