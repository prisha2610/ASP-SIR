function dt=sir(t,y)
    dt=[0;0;0];
    beta=0.05; %Rate of transmission
    gamma=0.02; %Rate of removal
    
    dt(1)=-beta*y(1);
    dt(2)=beta*y(1)-gamma*y(2);
    dt(3)=gamma*y(2);
end
