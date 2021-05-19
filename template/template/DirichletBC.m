function [A,b] = DirichletBC(A,b,alpha,iD)
%DIRICHLETBC Impose phi(iD)=alpha
%   Impose Dirichlet boundary condition phi=alpha in a given system A*phi=b
%   at the boundary points whose indices are in iD

N = numel(b);
I = speye(N);

% TODO

end

