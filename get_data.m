T=readtable('date-India-confirmed-recovered-dead.csv');
N=136641750;

R_all=T.r+T.d;
I_all=T.c-T.r-T.d;
S_all=N-T.c;
days=height(T);


phase=input('1. Pre-Nationwide Lockdown\n2. Lockdown Period\n3. Post-Nationwide Lockdown\n');
switch phase
    case 1
        S=S_all(41:63);
        I=I_all(41:63);
        R=R_all(41:63);
    case 2
        S=S_all(64:131);
        I=I_all(64:131);
        R=R_all(64:131);
    case 3
        S=S_all(132:end);
        I=I_all(132:end);
        R=R_all(132:end);
end

save('data.mat','N','days','S','I','R','phase','S_all','I_all','R_all');

title('Actual');
%plot(1:days,S,'-b');    %displaying susceptible population curve
hold on;
plot(1:days,I_all,'-r');    %displaying infected population curve
plot(1:days,R_all,'-g');   %displaying removed population curve
legend('Infected','Removed');
%axis([0,days,0,max(]);
xlabel('#days');
ylabel('population');
hold off;