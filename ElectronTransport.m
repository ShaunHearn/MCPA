function [] = ElectronTransport()
%ElectronTransport Monte Carlo Simulation of elctron movement in a
%semiconductor
%   

warning off

% Constants
Const.Mo = 9.11e-31;                % electron mass Kg
Const.Meff = 0.26*Const.Mo;         % effective mass
Const.kb = 1.38064852e-23;          % Boltzmann Constant (Kgm^2)/(Ks^2)
Const.q = 1.30217662e-19;            % Elementary Charge C

average = 0;
scatterProb = 0.05;         % Probability of scattering at each t
numSteps = 1000;            % number of iterations for sim
numOfParticles = 1000;      % set this maunually to what you want to sim
sizeX = 10;                % set size of the semiconductor region
positionX = zeros(1,numOfParticles);   % random postions of particles
velocity = zeros(1,numOfParticles);
V = 10;                     % Voltage Drop
positionX1 = zeros(1,numSteps);
velocity1 = zeros(1,numSteps);
avg1 = zeros(1,numSteps);

F = Const.q*V/sizeX;
a = F/Const.Mo;

t = sqrt(2*sizeX/a)/numSteps;
tStep = (0:numSteps -1)*t;

fig = figure();
ax = subplot(4,1,1,'Parent',fig);
hold(ax, 'on')
plotPos = plot(ax, tStep,positionX1);
title(ax, 'Particle Position');
xlabel(ax,'Time (s)');
ylabel(ax, 'Position (nm)');

ax2 = subplot(4,1,2,'Parent',fig);
hold(ax2, 'on')
plotVel = plot(ax2, tStep,velocity1);
title(ax2, 'Particle Velocity');
xlabel(ax2,'Time (s)');
ylabel(ax2, 'Velocity (m/s)');

ax3 = subplot(4,1,3,'Parent',fig);
hold(ax3, 'on')
plotXVel = plot(ax3,positionX1, velocity1);
title(ax3, 'Particle Velocity vs Position');
xlabel(ax3,'Position (nm)');
ylabel(ax3, 'Velocity (m/s)');

ax4 = subplot(4,1,4,'Parent',fig);
hold(ax4, 'on')
plotAvg = plot(ax4,tStep, avg1);
title(ax4, 'Particle Velocity Average');
xlabel(ax4,'Time (s)');
ylabel(ax4, 'Average Velocity (m/s)');


for n = 1:numSteps
    
    dv = a*t;
    velocity = velocity + dv;
    dx = velocity.*t + (a.*(t).^2)/2;
    positionX = positionX+ dx;
    positionX1(n) = positionX(1);
    velocity1(n) = velocity(1);
    average = sum(velocity)/numOfParticles;
    avg1(n) = average;
    
    scatteredPart = rand(1,numOfParticles) < scatterProb;
    velocity(scatteredPart) = -velocity(scatteredPart);
    
  set(plotPos, 'YData', positionX1);
  set(plotVel,'YData', velocity1);
  set(plotXVel,'XData',positionX1,'YData',velocity1);
  set(plotAvg,'YData',avg1);
  
  pause(0.001);
end












