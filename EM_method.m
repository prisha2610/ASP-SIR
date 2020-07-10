%EM simulation
clear
load('data.mat','N','i','days','beta','gamma');
dt=1;   %unit step
steps=days*dt;  %time-steps
S=zeros(steps,1);
I=zeros(steps,1);

S(1)=N-i;   %initial number of susceptibles
I(1)=i; %initial number of infectives

for t=1:steps-1
    eta=randn(2,1); %vector of two random numbers
    f(1)=beta*S(t)*I(t)*dt/N;   %expected transmitted population in time-step t
    f(2)=gamma*I(t)*dt; %expected removed population in time-step t
    gw=sqrt(f).*eta;    %simulated covariance values for time-step t (simplified vector form)
    s=S(t)-f(1)-gw(1);  %simulated susceptible population for time-step t+1
    i=I(t)+f(1)-f(2)+gw(1)-gw(2);   %simulated individual population for time-step t+1
     if i<=0    %end of epidemic condition
         S(t+1:steps)=s+i;
         I(t+1:steps)=0;
         break;
    elseif s<0  %non-negativity of susceptible population condition
         S(t+1)=0;
         I(t+1)=i-s;
     else
         S(t+1)=s;
         I(t+1)=i;
     end
end
R=N-S-I;    %S+I+R=N at any time-step

duration=t+1;    %duration of simulated epidemic
f_distribution=[S(end),I(end),R(end)];  %final distribution of population

title('EM method');
plot(1:steps,S,'-b');   %displaying number of susceptible individuals
hold on;
plot(1:steps,I,'-r');   %displaying number of infected individuals
plot(1:steps,R,'-g');   %displaying number of removed individuals
legend('Susceptible','Infected','Removed');
axis([0,N,0,days]);
xlabel('#days');
hold off;
ylabel('population');