function [Dr,Dth,Dr2,Dth2] = PartialDerivatives(r,theta)
%PARTIALDERIVATIVES Returns finite-difference discretization matrices
%   Generates sparse matrix representation of the finite-difference
%   approximation of the partial derivatives in polar coordinates

[I,J] = size(r);
N = I*J;
e = ones(N,1);
dr = r(2,1) - r(1,1);
dth= theta(1,2) - theta(1,1);

% TODO
Dr = spdiags([1*e/(2*dr) -1*e/(2*dr)],[-I I],N,N);
Dth = spdiags([1*e/(2*dth) -1*e/(2*dth)],[-1 1],N,N);
Dr2 = spdiags( [ 1*e/dr^2 -2*e/dr^2 1*e/dr^2 ] , [ -I  0  I ] , N,N );
Dth2 = spdiags( [ 1*e/dth^2 -2*e/dth^2 1*e/dth^2 ] , [ -1  0  1 ] , N,N );
end

