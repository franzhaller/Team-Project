function PlotPressureDistribution(p,r,th)
%PLOTPRESSUREDISTRIBUTION along the cylinder surface
%   Finds grid points lying on the cylinder surface r=ri and
%   plots P against TH

i = find(r==r(1,1));

figure(2);
subplot(1,2,2);

% TODO: PLOT PRESSURE DISTRIBUTION
plot(th(i),p(i));
xlabel('\theta');
ylabel('p');
title('pressure distribution along cylinder surface');
grid on;

end

