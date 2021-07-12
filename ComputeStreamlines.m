function [x,y] = ComputeStreamlines(up,vp,r,th,x0,y0)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here:
% Transforming from cartesian coordinates to polar coordinates:
[th0,r0] = cart2pol(x0,y0);

% The streamlines are governed by function (17).
% To calculate our function on every point, we have to interpolate it,
% therefor we use the MATLAB function griddedInterpolant.
Fu = griddedInterpolant(th',r',up'    ,'cubic','none');
Fv = griddedInterpolant(th',r',vp'./r','cubic','none');

% Function and starting points are passed to our "badass" ODE-solver:
[R,TH] = myode45(Fu,Fv,r0,th0);

% Transforming from polar coordinates to cartesian coordinates:
[x,y] = pol2cart(TH',R');

end

