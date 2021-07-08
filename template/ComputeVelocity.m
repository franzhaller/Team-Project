function [uc,vc,up,vp] = ComputeVelocity(phi,r,th)
%COMPUTEVELOCITY Compute velocity of the potential flow
%   around a cylinder in polar coordinates

[I,J] = size(r);
[Dr,Dth] = PartialDerivatives(r,th);
[Dr,Dth] = BoundaryDerivatives(r,th,Dr,Dth);
% TODO: COMPUTE THE POLAR VELOCITY COMPONENTS up AND vp

up = Dr*phi(:);
vp = r(:).^-1.*Dth*phi(:);

up = full(reshape(up,I,J));
vp = full(reshape(vp,I,J));

[uc,vc] = VecPol2Cart(up,vp,th,r);
end

