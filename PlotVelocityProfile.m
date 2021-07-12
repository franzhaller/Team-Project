function PlotVelocityProfile(u,th,y)
%PLOTVELOCITYPROFILE along the vertical centerline x=0
%   Finds grid points lying closest to the vertical centerline TH=pi/2 and
%   plots U against Y

[~,i] = min(abs(th-pi/2),[],2,'linear');

figure(2);
subplot(1,2,1);

% TODO: PLOT VELOCITY PROFILE

title('Velocity profile at x=0');
grid on;

end

