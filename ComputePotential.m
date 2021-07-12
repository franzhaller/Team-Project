function [phi,x,y,r,th,Dr,Dth] = ComputePotential(rc,ro,I,J)
%COMPUTEPOTENTIAL Compute velocity potential
%   of an incompressible irrotational flow around a cylinder in polar
%   coordinates

% Using the GenerateMesh-function and the pol2cart-function we optain
% the grid points in cartesian coordinates:
[r,th,dr,dth] = GenerateMesh(rc,ro,I,J);
[x,y] = pol2cart(th,r);

% With the PartialDerivatives-function we create the matrices for the
% discretication of partial derivatoves of the second order centered finite
% differences:
[Dr,Dth,Dr2,Dth2] = PartialDerivatives(r,th);
% The PolarLaplacian-function is used to compute the Laplacian operator in
% polar coordinates:
[A] = PolarLaplacian(r,Dr,Dr2,Dth2);
% Create an empty vector b with I*J entries:
b = sparse(I*J,1);

[ii,io,il,ir] = BoundaryIndices(r,th);

% Using the BoundaryIndices-function we apply Neumann boundary conditions
% at the inner radius and the left and right floor.
% At the outer radius we apply the Dirichlet boundary condition.
[A,b] =   NeumannBC(A,b,0,ii,dr ,-1);
[A,b] =   NeumannBC(A,b,0,il,dth,-I);
[A,b] =   NeumannBC(A,b,0,ir,dth, I);
[A,b] =   DirichletBC(A,b,x(io),io);

% Finally we compute the potential by solving the system A\b and reshape
% the matrix for I rows and J columns, adequate to the grid points:
phi = reshape( A\b ,I,J);

end

