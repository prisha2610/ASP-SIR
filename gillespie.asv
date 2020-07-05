load('data.mat','N','beta','gamma');
steps=1000;

t(1)=1;
S(1)=N-1;
I(1)=1;
i=1;

while(t(i)<=steps)
    u=rand(2,1);
    lambda=beta*S(i)*I(i)/N+gamma*I(i);
    t(i+1)=-log(u(1))/lambda;
    if u(2)<=beta*S(i)*I(i)/N 
        if S(i)~=0
            S(i+1)=S(i)-1;
            I(i+1)=I(i)+1;
        end
    else
        I(i+1)=I(i)-1;
    end
    i=i+1;
    if I(i)==0
        t(i)=steps;
    end
end

R=N-S-I;

plot(1:steps,S,'-b');
hold on;
plot(1:steps,I,'-r');
plot(1:steps,R,'-g');
hold on;