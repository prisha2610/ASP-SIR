clear
load('data.mat','N','i','days','beta','gamma');

t=0;    %initial time
S=N-i;   %initial susceptible population 
I=i; %initial susceptible population

while(t(end)<days)  %time for occurence of event can't exceed total time
    u=rand(2,1);    %vector of random numbers to simulate intervent time and event occurence
    lambda=(beta*S(end)*I(end))/N+gamma*I(end); %total rate of either event occurring
    t =[t, t(end)-log(u(1))/lambda];    %simulation of time at which next event occurs
    if u(2)<=beta*S(end)*I(end)/(N*lambda)   %condition for transmission to occur
        if S(end)~=0
            S=[S, S(end)-1];
            I=[I, I(end)+1];
        else    %condition for non-negativity of susceptible population
            S=[S, S(end)];
            I=[I, I(end)];
        end
    else    %condition for removal to occur
        S=[S, S(end)];
        I=[I, I(end)-1];
    end
    if I(end)==0    %condition for simulation to stop
        
        t=[t, days];
        S=[S, S(end)];
        I=[I, 0];
    end
end

R=N-S-I;

duration=t(end-1);    %duration of simulated epidemic
f_distribution=[S(end),I(end),R(end)];  %final distribution of population

plot(t,S,'-b'); %displaying susceptible population curve
hold on;
plot(t,I,'-r'); %displaying infected population curve
plot(t,R,'-g'); %displaying removed population curve

title('Gillespie algorithm');
legend('Susceptible','Infected','Removed');
axis([0,N,0,days]);
xlabel('#days');
ylabel('population');
hold off;