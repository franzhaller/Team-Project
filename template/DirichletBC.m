function [A,b] = DirichletBC(A,b,alpha,iD)
%DIRICHLETBC Impose phi(iD)=alpha
%   Impose Dirichlet boundary condition phi=alpha in a given system A*phi=b
%   at the boundary points whose indices are in iD

N = numel(b);
I = speye(N);


% TODO
%!!!!!!!!!!!!!!!! check I or 0 !!!!!!!!!!!!!!!
A(iD,:)=I(iD,:);



for i=1:length(iD)
    b(i*length(iD)) = alpha(i);
end

end

