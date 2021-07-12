function [Fx,Fy] = ComputeForce(p,r,th)
%COMPUTEFORCE acting on the inner cylinder
%   Computes the pressure force acting on the cylindrical surface r=ri,
%   th=<0,pi/2>

[ii,~,~,~,rc] = BoundaryIndices(r,th);
dth = th(1,2) - th(1,1);

% TODO: INTEGRATE THE PRESSURE OVER THE CYLINDER SURFACE TO OBTAIN THE
% TOTAL FORCE
% Starting values:
Fx = 0;
Fy = 0;

% Applying the trapezoidal rule:
for i=1:length(ii)-1
    Fx = Fx + (rc*p(ii(i))+rc*p(ii(i+1)))*0.5*dth*cos(th(ii(i)));
    Fy = Fy + (rc*p(ii(i))+rc*p(ii(i+1)))*0.5*dth*sin(th(ii(i)));
end

end

