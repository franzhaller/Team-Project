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
% Applying the forward and backward one-side finite difference-method:
Dr_fw = spdiags([-1*e/dr 1*e/dr],[0 1],N,N);
Dth_fw = spdiags([-1*e/dth 1*e/dth],[0 I],N,N);

Dr_bw = spdiags([-1*e/dr 1*e/dr],[-1 0],N,N);
Dth_bw = spdiags([-1*e/dth 1*e/dth],[-I 0],N,N);

% TODO: REPLACE THE ROWS OF Dr AND Dth CORRESPONDING TO THE PROBLEMATIC
% BOUNDARIES WITH THE MATCHING ROWS OF THE ONE-SIDED MATRICES
% Replace the rows concerning the inner and the left boundary
% with forward scheme and the outer and the right boundary with backward
% scheme
Dr(ii,:)=Dr_fw(ii,:);
Dr(io,:)=Dr_bw(io,:);
Dth(il,:)=Dth_fw(il,:);
Dth(ir,:)=Dth_bw(ir,:);
end

