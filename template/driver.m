% Parameters
rc = 0.5;
ro = 3;
I = 31;
J = 31;
Nstreamlines = 10;
x0 = -2*ones(Nstreamlines,1);
y0 = linspace(0.1,1.9,Nstreamlines)';

% Computation
[phi,x,y,r,th] = ComputePotential(rc,ro,I,J);
[phi_a,psi_a] = AnalyticalPotential(rc,x,y);
[uc,vc,up,vp] = ComputeVelocity(phi,r,th);
[ua,va]  = AnalyticalVelocity(rc,x,y);
[p] = ComputePressure(up,vp);
[Fx,Fy] = ComputeForce(p,r,th);
[strx,stry] = ComputeStreamlines(up,vp,r,th,x0,y0);


%% Post processing
% Initialize a figure with labels
figure(1); clf; hold on;
xlabel('x'); ylabel('y'); title('Potential flow over a bump');

% Plot solution
contourf(x,y,p);    quiver(x,y,ua,va);
quiver(x,y,uc,vc);  quiver(0,0,Fx,Fy);
plot(strx,stry,'m.-','LineWidth',1.5,'MarkerSize',20);
legend('pressure','analytical velocity','velocity','force','streamlines');

% Graphs
PlotVelocityProfile(uc,th,y);
PlotPressureDistribution(p,r,th);
