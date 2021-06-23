function [Dr,Dth] = BoundaryDerivatives(r,th,Dr,Dth)
%BOUNDARYDERIVATIVES Corrects the finite-difference matrices on boundaries
%   Replaces centered finite difference with one-sided finite difference
%   where necessary
%   

[I,J] = size(r);
N = I*J;
e = ones(N,1);
dr = r(2,1) - r(1,1);
dth= th(1,2) - th(1,1);
[ii,io,il,ir] = BoundaryIndices(r,th);

% TODO: CREATE DISCRETIZATION MATRICES WITH ONE-SIDED FINITE DIFFERENCES

% TODO: REPLACE THE ROWS OF Dr AND Dth CORRESPONDING TO THE PROBLEMATIC
% BOUNDARIES WITH THE MATCHING ROWS OF THE ONE-SIDED MATRICES

end

