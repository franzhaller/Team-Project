function [phi,x,y,r,th,Dr,Dth] = ComputePotential(rc,ro,I,J)
%COMPUTEPOTENTIAL Compute velocity potential
%   of an incompressible irrotational flow around a cylinder in polar
%   coordinates

[r,th,dr,dth] = GenerateMesh(rc,ro,I,J);
[x,y] = pol2cart(th,r);


[Dr,Dth,Dr2,Dth2] = PartialDerivatives(r,th);
[A] = PolarLaplacian(r,Dr,Dr2,Dth2);

b = sparse(I*J,1);


[ii,io,il,ir,] = BoundaryIndices(r,th);

[A,b] =   NeumannBC(A,b,0,ii,dr ,-1);
[A,b] =   NeumannBC(A,b,0,il,dth,I);
[A,b] =   NeumannBC(A,b,0,ir,dth, -I);
[A,b] = DirichletBC(A,b,x(io),io);
phi = reshape( A\b ,I,J);
end

