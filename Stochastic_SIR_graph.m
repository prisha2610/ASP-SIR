clear all
close all
clc
FS=20;

N=1000;
dt=5;
e=0.5;
c=4/dt;

r=0.4/dt;

r=1.1/dt;
num_steps=200;

beta=e*c
r=r


%%Initial Conditions
S0=N-1;
I0=N-S0;
R0=0;

num_runs=100;
figure('position',[1,200,1600,800])

for run=1:num_runs
    x(:,1)=[S0;I0;R0];
    for k=1:num_steps
        S=x(1,k);
        I=x(2,k);
        R=x(3,k);
        StoI=binornd(round(S),(e*c*I/N));
        ItoR=binornd(I,r)
        
        x(:,k+1)=x(:,k)+[-StoI; StoI-ItoR; ItoR];
    end
    
    plot(0:num_steps, x(1,:), 'b', 'MarkerSize',10,'LineWidth',2)
    hold on
    plot(0:num_steps, x(2,:), 'r', 'MarkerSize',10,'LineWidth',2)
    plot(0:num_steps, x(3,:), 'g', 'MarkerSize',10,'LineWidth',2)
    legend('Susceptible','Infected','Recovered')
    
    xlabel('n','FontSize',FS)
    
    set(gca,'FontSize',FS)
    pause(0.1)
end



