function [uc,vc,x,y] = VecPol2Cart(up,vp,theta,r)
%VECPOL2CART Transform polar vector to Cartesian
%   Transform vector from polar basis to Cartesian basis
[x,y] = pol2cart(theta,r);
uc = up.*cos(theta) -vp.*sin(theta);
vc = up.*sin(theta) +vp.*cos(theta);
end

