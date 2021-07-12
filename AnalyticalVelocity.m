function [u,v] = AnalyticalVelocity(ri,x,y)
%ANALYTICALVELOCITY of the potential flow around a cylinder
%   Returns the two-dimensional velocity field of the potential flow around
%   a circular cylinder using an analytical formula.

z = x + 1i*y;
U = 1-ri^2./z.^2;
u =  real(U);
v = -imag(U);

end

