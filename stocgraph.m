N=1000;

dt=1;

beta=0.08;
gamma=0.01;

num_steps=1000;

%%Initial Conditions
S0=N-1;
I0=1;
R0=0;

num_runs=10;

for run=1:num_runs
    x(:,1)=[S0;I0;R0];
    for k=1:num_steps
        S=x(1,k);
        I=x(2,k);
        R=x(3,k);
        StoI=binornd(round(S),beta*dt*I/N);
        ItoR=binornd(I,gamma*dt);
        
        x(:,k+1)=x(:,k)+[-StoI; StoI-ItoR; ItoR];
    end
    
    plot(0:num_steps, x(1,:), 'b', 'MarkerSize',5,'LineWidth',1);
    hold on;
    plot(0:num_steps, x(2,:), 'r', 'MarkerSize',5,'LineWidth',1);
    plot(0:num_steps, x(3,:), 'g', 'MarkerSize',5,'LineWidth',1);
    
    legend('Susceptible','Infected','Recovered');
    xlabel('n');
    
    pause(0.1);
end