function [p] = ComputePressure(u,v)
%COMPUTEPRESSURE of a potential flow from a given velocity field
%   Computes dynamic pressure of a potential flow using the Bernouli
%   equation

[I,J] = size(u);

% TODO: COMPUTE PRESSURE FROM THE VELOCITY COMPONENTS

p = reshape(p,I,J);

end

