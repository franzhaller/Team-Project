%testcase
close all
clc
clear

%inputs
rc = 0.5;
ro = 3;

I = 31;
J = 31;


%Discretization

[phi,x,y,r,theta,Dr,Dth] = ComputePotential(rc,ro,I,J);
[phi_a,psi_a] = AnalyticalPotential(rc,x,y);

[uc,vc,up,vp] = ComputeVelocity(phi,r,theta);
[u_a,v_a] = AnalyticalVelocity(rc,x,y);


% contour plot
figure(2)
clevels = 30;

subplot(2,1,1)
contour(x,y,phi,clevels)
xlabel('X'), ylabel('Y')
title('phi')

subplot(2,1,2)
contour(x,y,phi_a,clevels)
xlabel('X'), ylabel('Y')
title('phi_a')

% velocity field plot
figure(3)
subplot(2,1,1)
quiver(x,y,uc,vc)
xlabel('X'), ylabel('Y'),
title('velocity field')

subplot(2,1,2)
quiver(x,y,u_a,v_a)
xlabel('X'), ylabel('Y')
title('velocity field analytical')




