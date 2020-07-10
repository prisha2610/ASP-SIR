%deterministic curves 
clear
load('data.mat','N','i','days');   % use pre-stored values

y0=[N-i;i];

[t,y] = ode45(@odefunc, [0 days], y0); %obtaining ODE solution

duration=t(end-1);    %duration of simulated epidemic
f_distribution=[S(end),I(end),R(end)];  %final distribution of population

title('ODE');
plot(t,y(:,1),'-b');    %displaying susceptible population curve
hold on;
plot(t,y(:,2),'-r');    %displaying infected population curve
plot(t,N-y(:,1)-y(:,2),'-g');   %displaying removed population curve
legend('Susceptible','Infected','Removed');
axis([0,N,0,days]);
xlabel('#days');
ylabel('population');
hold off;