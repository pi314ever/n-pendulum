%% Pendulum Main
% 
%% Variable setup
clc;clear;close all;pause on
n = 13; %number of pendulumn masses
P.g = 9.81; %gravity constant
P.m = 1.0*ones(n,1)+ 0*rand(n,1); 
P.l = 1.0*ones(n,1)+ 0*rand(n,1);
theta0= pi/180*(0+0*rand(n,1));
dtheta0= 0*ones(n,1);
x0 = [theta0;dtheta0];
ts= [0,50]; %Simulation time interval
out = nPen(ts,x0,P);
x = out.x;
time = out.t;

close all
nLinkEnergy(x,time,P)
Animation(x,time,P)
% Save necessary variables
filename = '13p8dp50s';
save(filename,'x','time','P')
pause()

%% 3-Pendulum 100 deg offset all angles, 50 seconds sim
clear;close all
load('3p100d50s.mat')
nLinkEnergy(x,time,P)
Animation(x,time,P)
pause()

%% 50-pendulum 100 deg offset all angles, 50 seconds sim
clear;close all
load('50p100d50s.mat')
nLinkEnergy(x,time,P)
Animation(x,time,P)
pause()

%% 100-pendulum 80 deg offset all angles, 20 seconds sim
clear;close all
load('100p80d20s.mat')
nLinkEnergy(x,time,P)
Animation(x,time,P)
pause()

%% 100-pendulum 0 +/- 90 deg random offset, 20 seconds sim
clear;close all
load('100p0090R20s.mat')
nLinkEnergy(x,time,P)
Animation(x,time,P)
pause()

%% 100-pendulum 179 deg offset all angles, 20 seconds sim
clear;close all
load('100p179d20s.mat')
nLinkEnergy(x,time,P)
Animation(x,time,P)
pause()