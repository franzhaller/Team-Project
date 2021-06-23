function [r,theta,dr,dtheta] = GenerateMesh(rc,ro,I,J)
%GENERATEMESH in polar coordinates and return grid spacings
%   Generates polar coordinates of uniformly distributed grid points

% IMPLEMENT YOUR CODE HERE

%calculate dr
dr = (ro-rc)/(I-1);
%calculate dhteta
dtheta = pi/(J-1);

r= meshgrid(rc:dr:ro,1:J)';
theta = meshgrid(0:dtheta:pi,1:I);

end


