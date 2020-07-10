clear all
close all

N=350; %population size

S0=349; %Initial susceptible popuation
I0=1; %Initial infected population
R0=N-S0-I0; % Initial removed population

beta=10; %Rate of infection
gamma=0.5; %Rate of recovery/removal

V=100; %Spatial parameter

T=100; %Maximum elapsed time


S=S0;
I=I0;
R=R0;


t=0;
count=0;
data=[];

while t<=T
    if I==0
        break
    end
    
    W1=beta*S*I/V;
    W2=gamma*I;
    W=W1+W2;
    
    dt=-log(rand)/W;
    t=t+dt;
    count=count+1;
    
    if rand<(W1/W);  
        S=S-1;
        I=I+1;
    
    else
        I=I-1;
        R=R+1;
    end
        
    data=[data; [S, I, R]];
    size(data);
end

    
 
    
    plot(0:count-1, data(:,1), 'b', 'MarkerSize',10,'LineWidth',2)
    hold on
    plot(0:count-1, data(:,2), 'r', 'MarkerSize',10,'LineWidth',2)
    plot(0:count-1, data(:,3), 'g', 'MarkerSize',10,'LineWidth',2)
        

    