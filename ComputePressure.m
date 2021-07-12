function [p] = ComputePressure(u,v)
%COMPUTEPRESSURE of a potential flow from a given velocity field
%   Computes dynamic pressure of a potential flow using the Bernouli
%   equation

[I,J] = size(u);

% TODO: COMPUTE PRESSURE FROM THE VELOCITY COMPONENTS
% creating a unit vector with I*J entries:
e = ones(I*J,1);

% Using the Bernoulli equation:
p = e.*1/2 - 1/2*(u(:).^2+v(:).^2);

% Computing the pressure field:
p = reshape(p,I,J);

end

