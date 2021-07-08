function [A,b] = NeumannBC(A,b,beta,iN,dn,iG)
%NEUMANNBC Impose Neumann BC at grid points iN
%   Impose Neumann BC at boundary grid points with indices in iN

for i = iN'

    % TODO: IMPLEMENT NEUMANN BC
    
    % !!!!!!! vorzeichen iG überprüfen !!!!!!!
    
  
    A(i,i-iG) = A(i,i-iG)+A(i-iG,i);
    b(i)=b(i)+ 2*A(i-iG,i)*dn*beta;
  
    if i+iG>0 && i+iG<size(A,2)
        % TODO: ERASE LINK TO THE OPPOSITE BOUNDARY
        % size(A,2) ... number of columns
        A(i,i+iG)=0;
    end
    
end

end

