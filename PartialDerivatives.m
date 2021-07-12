function [Dr,Dth,Dr2,Dth2] = PartialDerivatives(r,theta)
%PARTIALDERIVATIVES Returns finite-difference discretization matrices
%   Generates sparse matrix representation of the finite-difference
%   approximation of the partial derivatives in polar coordinates

[I,J] = size(r);
m = I*J;
e = ones(m,1);
dr = r(2,1) - r(1,1);
dth= theta(1,2) - theta(1,1);

% TODO:
% Creating the diagonal discretization-matrizes:
Dr = spdiags([-1*e/(2*dr) 1*e/(2*dr)],[-1 1],m,m);
Dr2 = spdiags( [ 1*e/dr^2 -2*e/dr^2 1*e/dr^2 ] , [ -1  0  1 ] , m,m );

Dth = spdiags([-1*e/(2*dth) 1*e/(2*dth)],[-I I],m,m);
Dth2 = spdiags( [ 1*e/dth^2 -2*e/dth^2 1*e/dth^2 ] , [ -I  0  I ] , m,m );
end

