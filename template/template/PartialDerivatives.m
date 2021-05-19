function [Dr,Dth,Dr2,Dth2] = PartialDerivatives(r,th)
%PARTIALDERIVATIVES Returns finite-difference discretization matrices
%   Generates sparse matrix representation of the finite-difference
%   approximation of the partial derivatives in polar coordinates

[I,J] = size(r);
N = I*J;
e = ones(N,1);
dr = r(2,1) - r(1,1);
dth= th(1,2) - th(1,1);

% TODO

end

