function [A,b] = NeumannBC(A,b,beta,iN,dx,iG)
%NEUMANNBC Impose Neumann BC at grid points iN
%   Impose Neumann BC at boundary grid points with indices in iN

for i = iN'

    % TODO: IMPLEMENT NEUMANN BC
    
    if i+iG>0 && i+iG<size(A,2)
        % TODO: ERASE LINK TO THE OPPOSITE BOUNDARY
    end
    
end

end

