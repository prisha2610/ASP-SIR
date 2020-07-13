% Script for deterministic curve plot
% ------------------------------------
% The variables used are -
% N -- Total population
% days -- Total number of days for which data is available
% x -- Start index of time period
% y -- End index of time period
% i -- Initial number of infectives
% beta -- Estimated value of transmission parameter 
% gamma -- Estimated value of removal parameter
% f1 -- Figure for showing actual data + ODE
% f2 -- Figure for showing ODE over longer period of time
% t --
% var --
% id --
% f_spread -- final number of cases
% ------------------------------------
global N days i
global beta gamma x y
global f1 f2 

warning ('on');
y0=[N-i;i];

[t,var] = ode45(@(t,var) odefunc(t,var,beta,gamma), [x 4*days], y0); %obtaining ODE solution

f_spread=N-var(end,1)-var(end,2);

id=find(t<=y);
figure(f1);
plot(t(id),var(id,2),'-r','DisplayName','ODE');

f2=figure;
plot(t,var(:,1),'-b');
hold on;
plot(t,var(:,2),'-r');
plot(t,N-var(:,1)-var(:,2),'-g');
legend('Susceptible','Infected','Removed');
title('ODE');
xlabel('#Days');
ylabel('Population');
