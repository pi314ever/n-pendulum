function [out] = nPen(ts,x0,P)
% AE 199 Project 1 Nth link simulation MAIN
%Initialization 
sol = ode23t(@(t,x)eqn(t,x,P),ts,x0);
% Break apart solution for plotting
time = ts(1):.05:sol.x(end);
x = deval(sol,time); % Evaluate solution from ode45 at points in time
%time = sol.x;
%x = sol.y;
out.x = x;
out.t = time;
end