function [Fx,Fy] = ComputeForce(p,r,th)
%COMPUTEFORCE acting on the inner cylinder
%   Computes the pressure force acting on the cylindrical surface r=ri,
%   th=<0,pi/2>

[ii,~,~,~,ri] = BoundaryIndices(r,th);
dth = th(1,2) - th(1,1);

% TODO: INTEGRATE THE PRESSURE OVER THE CYLINDER SURFACE TO OBTAIN THE
% TOTAL FORCE

end

