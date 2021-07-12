function [r,theta,dr,dtheta] = GenerateMesh(rc,ro,I,J)
%GENERATEMESH in polar coordinates and return grid spacings
%   Generates polar coordinates of uniformly distributed grid points

% IMPLEMENT YOUR CODE HERE

% Calculating dr:
dr = (ro-rc)/(I-1);
% Calculating dhteta:
dtheta = pi/(J-1);

% Generating a two-dimensional polar grid with I and J number of points in
% r and theta direction:
r= meshgrid(rc:dr:ro,1:J)';
theta = meshgrid(0:dtheta:pi,1:I);
end


