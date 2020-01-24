function [] = ElectronTransport()
%ElectronTransport Monte Carlo Simulation of elctron movement in a
%semiconductor
%   

% Constants
Const.Mo = 9.11e-31;                % electron mass Kg
Const.Meff = 0.26*Const.Mo;         % effective mass
Const.kb = 1.38064852e-23;          % Boltzmann Constant (Kgm^2)/(Ks^2)
Const.q = 1.30217662e-19            % Elementary Charge C

numSteps = 1000;            % number of iterations for sim
numOfParticles = 1000;      % set this maunually to what you want to sim
sizeX = 10;                % set size of the semiconductor region
positionX = sizeX*rand(1,numOfParticles);   % random postions of particles
V = 10;                     % Voltage Drop

F = q*V/sizeX;
a = F/Const.Mo;

t = sqrt(2*sizeX/a)/numSteps;








