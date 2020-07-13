% Script for Gillespie Algorithm

global N days beta gamma
global i x y
global f1 f2

t=x;    %initial time
S=N-i;   %initial susceptible population 
I=i; %initial susceptible population

while(t<4*days && I~=0)  %time for occurence of event can't exceed total time
    plot(t,S,'ob');
    plot(t,I,'or');
    u=rand(2,1);    %vector of random numbers to simulate intervent time and event occurence
    lambda=(beta*S(end)*I(end))/N+gamma*I(end); %total rate of either event occurring
    t =t-log(u(1))/lambda;    %simulation of time at which next event occurs
    if u(2)<=beta*S*I/(N*lambda)   %condition for transmission to occur
        if S~=0
            S=S-1;
            I=I+1;
        end
    else    %condition for removal to occur
        I=I-1;
    end
end

R=N-S-I;

duration=t;    %duration of simulated epidemic
f_distribution=[S,I,R];  %final distribution of population

id=find(t<=y);
figure(f1);
plot(t(id),var(id,2),'-r','DisplayName','Gillespie Algo');

f3=f2;
plot(t,S,'--b'); %displaying susceptible population curve
hold on;
plot(t,I,'--r'); %displaying infected population curve
plot(t,R,'--g'); %displaying removed population curve
title('Gillespie algorithm + ODE');
legend('Susceptible','Infected','Removed');
xlabel('#Days');
ylabel('Population');