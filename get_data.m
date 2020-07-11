T=readtable('date-India-confirmed-recovered-dead.csv');
load('data.mat','N');
R=T.r+T.d;
I=T.c-R;
S=N-I-R;
days=height(T);
save('data.mat','S','I','R','-append');

title('Actual');
plot(1:days,S,'-b');    %displaying susceptible population curve
hold on;
plot(1:days,I,'-r');    %displaying infected population curve
plot(1:days,R,'-g');   %displaying removed population curve
legend('Susceptible','Infected','Removed');
axis([0,days,0,N]);
xlabel('#days');
ylabel('population');
hold off;