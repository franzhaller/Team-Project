%testcase
clc
clear

%inputs
rc = 0.5;
ro = 3;

I = 31;
J = 31;

x0=-2*ones(1,10);
y0= linspace(0.1,1.9,10);

%-----------------------------------

% %Discretization
% [r,theta,dr,dth] = GenerateMesh(rc,ro,I,J);
% [ii,io,il,ir] = BoundaryIndices(r,theta);

%Compute Potential
[phi,x,y,r,theta,Dr,Dth] = ComputePotential(rc,ro,I,J);
[phi_a,psi_a] = AnalyticalPotential(rc,x,y);

%Compute Velocity
[uc,vc,up,vp] = ComputeVelocity(phi,r,theta);
[u_a,v_a] = AnalyticalVelocity(rc,x,y);

%Compute Pressure & Force
[p] = ComputePressure(uc,vc);
[Fx,Fy] = ComputeForce(p,r,theta);

%Compute Streamlines
[strx,stry] = ComputeStreamlines(up,vp,r,theta,x0,y0);

plotFcn(x,y,phi,phi_a,uc,vc,u_a,v_a,p,strx,stry)

