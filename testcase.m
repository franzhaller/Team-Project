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
[r,theta,dr,dtheta] = GenerateMesh(rc,ro,I,J);
[ii,io,il,ir,rc,ro,thl,thr,par] = BoundaryIndices(r,theta);


[phi,x,y,r,theta,Dr,Dth] = ComputePotential(rc,ro,I,J);
[phi_a,psi_a] = AnalyticalPotential(rc,x,y);

[uc,vc,up,vp] = ComputeVelocity(phi,r,theta);
[uca,vca,upa,vpa] = ComputeVelocity(phi_a,r,theta);

[Dr,Dth] = BoundaryDerivatives(r,theta,Dr,Dth);
[u_a,v_a] = AnalyticalVelocity(rc,x,y);

for i=1:length(uc)
    uc_neu(i,:)=uc(length(uc)+1-i,:);
end
for i=1:length(uca)
    uca_neu(i,:)=uca(length(uca)+1-i,:);
end




for i=1:length(vc)
    vc_neu(i,:)=vc(length(vc)+1-i,:);
end
