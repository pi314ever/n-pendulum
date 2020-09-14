%% AE 199 Project 1 Nth link simulation MAIN
clc;clear
%Initialization 
n = 12; %number of pendulumn masses
P.g = 9.81; %gravity constant
P.m = 1.0*ones(n,1)+ 0*rand(n,1); 
P.l = 1.0*ones(n,1)+ 0*rand(n,1);
theta0= pi/180*(10+0*rand(n,1));
dtheta0= zeros(n,1);
x0 = [theta0;dtheta0];
ts= [0,20]; %Simulation time interval
sol = ode23(@(t,x)eqn(t,x,P),ts,x0);

% Break apart solution for plotting
time = ts(1):.05:sol.x(end);
x = deval(sol,time); %Evaluate solution from ode45 at points in time
%time = sol.x;
%x = sol.y;
theta = x(1:n,:);
w = x(n+1:2*n,:);
%Loop for posiition derivation
m = P.m;
l = P.l;

%%
close all;
%nLinkEnergy(theta,w,time,P)
%Call animation function
Animation(theta,time,P)
  