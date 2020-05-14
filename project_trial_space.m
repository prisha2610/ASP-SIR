m=size(mhcovid,1);
n=112374333;    %2011 census

diag=mhcovid(:,3);
rcvr=mhcovid(:,1);
dead=mhcovid(:,2);
R=rcvr+dead;
I=diag-R;
S=n*ones(m,1)-diag;

alpha=10^-29;
N=10^6;

[lambda1,mu1,J1]=deterministic(S,I,alpha,N);

%viewI(lambda1,mu1,S,I);
viewR(mu1,I,R);
