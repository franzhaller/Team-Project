function [R,TH] = myode45(fu,fv,r0,th0)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

tol   = 1e-6;
dt    = 2e-1;
dtmax = 2e-1;
dtmin = 1e-3;
chunk = 50;
r     = r0(:);
th    = th0(:);
neq   = length(r);
R     = zeros(neq,chunk);
TH    = zeros(neq,chunk);
nout  = 0;

% Parameters from ode45
pow = 1/5;
b11=1/5; 
b21=3/40; 
b31=44/45;
b41=19372/6561;
b51=9017/3168;
b61=35/384;
b22=9/40;
b32=-56/15;
b42=-25360/2187;
b52=-355/33;
b33=32/9;
b43=64448/6561;
b53=46732/5247;
b63=500/1113;
b44=-212/729;
b54=49/176;
b64=125/192;
b55=-5103/18656;
b65=-2187/6784;
b66=11/84;
e1=71/57600;
e3=-71/16695;
e4=71/1920;
e5=-17253/339200;
e6=22/525;
e7=-1/40;
c1=5179/57600;
c3=7571/16695;
c4=393/640;
c5=-92097/339200;
c6=187/2100;
c7=1/40;

while ~any(isnan(R),'all')

    % Save trajectory
    nout = nout + 1;
    if nout>size(R,2)
        R = [ R, zeros(neq,chunk) ];
        TH= [TH, zeros(neq,chunk) ];
    end
    R( :,nout) = r;
    TH(:,nout) = th;
    
    % Runge-Kutta 5
    k1r =
    k1th=
    k2r =       % TODO: 
    k2th=       %   IMPLEMENT
    ...         %   RK5 7M
    k7r =       %   HERE
    k7th=
    
    r   =     
    th  =     
    
    % Estimate error
    err = norm(e1*k1r +e3*k3r +e4*k4r +e5*k5r +e6*k6r +e7*k7r )/norm(r) ...
        + norm(e1*k1th+e3*k3th+e4*k4th+e5*k5th+e6*k6th+e7*k7th)/norm(th);
    temp = dt*(tol*dt/2/err).^pow;
    temp2= min([temp ,dtmax,  2*dt]);
    dt   = max([temp2,dtmin,0.5*dt]);
    fprintf('DT = %7.1e \n',dt);    
    
end

R  =  R(:,1:nout);
TH = TH(:,1:nout);

end

