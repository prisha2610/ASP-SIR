m=size(mhcovid,1);
n=112374333;    %2011 census

diag=mhcovid(:,3);
rcvr=mhcovid(:,1);
dead=mhcovid(:,2);
R=rcvr+dead;
I=diag-R;
S=n*ones(m,1)-diag;

alpha(1)=3*10^-25;
alpha(2)=10^-10;
N=10^3;

[lambda,mu,J]=deterministic(S,I,R,alpha,N);

%viewI(lambda,mu,S,I);
%viewR(mu,I,R);        %%%
%viewS(lambda,S,I);

%disp(['Min percentage of susceptibles=',num2str(min(100*S/n))]);
%disp(['Max percentage of susceptibles=',num2str(max(100*S/n))]);
%disp('Thus it is a reasonable assumption to consider Linear Growth Model')

P=stochastic(lambda,mu,n,60);
plot((1:m)*24,I,'-r');
hold on;
plot((1:m)*24,R,'-k');
hold on;