load('data.mat');

y0=[N-1;1];
steps=1000;

[t,y] = ode45(@odefunc, [0 steps], y0);

plot(t,y(:,1),'-b');
hold on;
plot(t,y(:,2),'-r');
plot(t,N-y(:,1)-y(:,2),'-g');
hold on;