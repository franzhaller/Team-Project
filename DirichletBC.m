function [A,b] = DirichletBC(A,b,alpha,iD)
%DIRICHLETBC Impose phi(iD)=alpha
%   Impose Dirichlet boundary condition phi=alpha in a given system A*phi=b
%   at the boundary points whose indices are in iD

% Calculateing the number of elements of b:
N = numel(b);

% Creating an identity matrix: 
I = speye(N);

% TODO
% Replacing the rows of the discretization matrix A with the ones of the
% identity matrix I at the passed indices iD:
A(iD,:)=I(iD,:);

% Exchanging the right hand side b with the passed value alpha at the
% indices iD:
for i=1:length(iD)
    b(i*length(iD)) = alpha(i);
end

end

