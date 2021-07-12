function [phi,psi] = AnalyticalPotential(rc,x,y)
%ANALYTICALPOTENTIAL of the flow around a cylinder
%   Returns the velocity potential and stream function of the potential 
%   flow around a circular cylinder using an analytical formula.

z = x + 1i*y;
Phi = z+rc^2./z;
phi =  real(Phi);
psi =  imag(Phi);

end

