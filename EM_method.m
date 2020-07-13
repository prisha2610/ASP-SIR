%EM simulation

global N days beta gamma
global i x y
global f1 f2

dt=1;   %unit step
steps=4*days*dt;  %time-steps
S=zeros(steps-x,1);
I=zeros(steps-x,1);

S(1)=N-i;   %initial number of susceptibles
I(1)=i; %initial number of infectives

for t=x:steps-1
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

id=find(t<=y);
figure(f1);
plot(t(id),var(id,2),'-r','DisplayName','EM Method');

f4=f2;
plot(t,S,'-b'); %displaying susceptible population curve
hold on;
plot(t,I,'-r'); %displaying infected population curve
plot(t,R,'-g'); %displaying removed population curve
title('EM method + ODE');
legend('Susceptible','Infected','Removed');
xlabel('#Days');
ylabel('Population');