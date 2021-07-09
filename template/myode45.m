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
b62=0;
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
c2=0;
c3=7571/16695;
c4=393/640;
c5=-92097/339200;
c6=187/2100;
c7=1/40;

while ~any(isnan(R),'all')     % if any entry in R is NaN 
                               % -> logical 0 -> stop loop
    % Save trajectory
    nout = nout + 1;
    if nout>size(R,2)
        R = [ R, zeros(neq,chunk) ];
        TH= [TH, zeros(neq,chunk) ];
    end
    R( :,nout) = r;
    TH(:,nout) = th;
    
    % Runge-Kutta 5
    k1r = fu(th,r);
    k1th= fv(th,r);
    
    k2r = fu(th+dt*b11*k1th,r+dt*b11*k1r);
    k2th = fv(th+dt*b11*k1th,r+dt*b11*k1r);
    
    k3r = fu(th+dt*(b21*k1th+b22*k2th),...
        r+dt*(b21*k1r+b22*k2r));
    k3th = fv(th+dt*(b21*k1th+b22*k2th),...
        r+dt*(b21*k1r+b22*k2r));
    
    k4r = fu(th+dt*(b31*k1th+b32*k2th+b33*k3th),...
        r+dt*(b31*k1r+b32*k2r+b33*k3r));
    k4th = fv(th+dt*(b31*k1th+b32*k2th+b33*k3th),...
        r+dt*(b31*k1r+b32*k2r+b33*k3r));
    
    k5r = fu(th+dt*(b41*k1th+b42*k2th+b43*k3th+b44*k4th),...
        r+dt*(b41*k1r+b42*k2r+b43*k3r+b44*k4r));
    k5th = fv(th+dt*(b41*k1th+b42*k2th+b43*k3th+b44*k4th),...
        r+dt*(b41*k1r+b42*k2r+b43*k3r+b44*k4r));
    
    k6r = fu(th+dt*(b51*k1th+b52*k2th+b53*k3th+b54*k4th+b55*k5th),...
        r+dt*(b51*k1r+b52*k2r+b53*k3r+b54*k4r+b55*k5r));  
    k6th = fv(th+dt*(b51*k1th+b52*k2th+b53*k3th+b54*k4th+b55*k5th),...
        r+dt*(b51*k1r+b52*k2r+b53*k3r+b54*k4r+b55*k5r));      
    
    k7r = fu(th+dt*(b61*k1th+b62*k2th+b63*k3th+b64*k4th+b65*k5th+b66*k6th),...
        r+dt*(b61*k1r+b62*k2r+b63*k3r+b64*k4r+b65*k5r+b66*k6r));        
    k7th = fv(th+dt*(b61*k1th+b62*k2th+b63*k3th+b64*k4th+b65*k5th+b66*k6th),...
        r+dt*(b61*k1r+b62*k2r+b63*k3r+b64*k4r+b65*k5r+b66*k6r));     
       
    r   =  r + dt*(c1*k1r+c2*k2r+c3*k3r+c4*k4r+c5*k5r+c6*k6r+c7*k7r);
    th  =  th + dt*(c1*k1th+c2*k2th+c3*k3th+c4*k4th+c5*k5th+c6*k6th+c7*k7th);   
    
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

