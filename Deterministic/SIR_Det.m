clear all
close all

N=1000; %population size

S0=990; %Initial susceptible popuation
I0=10; %Initial infected population
R0=N-S0-I0; % Initial removed population

s = S0/N; 
i = I0/N; 
r = R0/N;

cond=[s i r];
[t,y]=ode45('sir_func', [0,365], cond);

plot(t,y, 'Linewidth', 2);
xlim([0, 365]);
xticks(0:20:365);
legend('S','I','R', 'Location','best');