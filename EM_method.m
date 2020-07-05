load('data.mat','N','beta','gamma');
steps=1000;
dt=1;
S=zeros(steps,1);
I=zeros(steps,1);

S(1)=N-1;
I(1)=1;

for t=1:steps-1
    eta=randn(2,1);
    f(1)=beta*S(t)*I(t)*dt/N;
    f(2)=gamma*I(t)*dt;
    gw=sqrt(f).*eta;
    S(t+1)=S(t)-f(1)-gw(1);
    I(t+1)=I(t)+f(1)-f(2)+gw(1)-gw(2);
    if S(t+1)<0
        S(t+1)=0;
    end
    if I(t+1)<=0
        S(t+1:steps)=S(t+1);
        I(t+1:steps)=0;
        break;
    end
end
R=N-S-I;

plot(1:steps,S,'-b');
hold on;
plot(1:steps,I,'-r');
plot(1:steps,R,'-g');
hold on;