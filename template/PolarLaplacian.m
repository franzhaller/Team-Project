function [A] = PolarLaplacian(r,Dr,Dr2,Dth2)
%POLARLAPLACIAN Finite-difference approximation of Laplacian in polar coor.
%   Generates sparse matrix representation of the finite-difference
%   approximation of the Laplace operator in polar coordinates

% TODO
A = 1\r(:).*Dr + Dr2 + 1\(r(:).^2).*Dth2;
end

