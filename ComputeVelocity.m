function [uc,vc,up,vp] = ComputeVelocity(phi,r,th)
%COMPUTEVELOCITY Compute velocity of the potential flow
%   around a cylinder in polar coordinates

% the size of our grid:
[I,J] = size(r);

% Getting the matrices Dr and Dth in order to implement the one-sided
% finite differneces at the boundaries with the function
% BoundaryDerivatives:
[Dr,Dth] = PartialDerivatives(r,th);
[Dr,Dth] = BoundaryDerivatives(r,th,Dr,Dth);

% TODO: COMPUTE THE POLAR VELOCITY COMPONENTS up AND vp

% Applying the formulas given in 4.c). To multiply the discretization
% matrix with our pontential we transform it into a vector with the
% operator "(:)":
up = Dr*phi(:);
vp = r(:).^-1.*Dth*phi(:);

% Reshaping the calculated velocity into a I*J matrix:
up = full(reshape(up,I,J));
vp = full(reshape(vp,I,J));

% Transforming from polar coordinate system to cartesian coordinate system:
[uc,vc] = VecPol2Cart(up,vp,th,r);
end

