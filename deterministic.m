function [lambda,mu,J_f]=deterministic(S,I,alpha,N)

dS=d_dt(S);
dI=d_dt(I);

m=length(dS);
lambda=0;
mu=0;
J=zeros(N,1);
grad=zeros(N,2);
for i=1:N
    h=[-lambda*(S.*I) , lambda*(S.*I)-mu*I];
    J(i)=(1/(2*m))*sum((dS-h(:,1)).^2+(dI-h(:,2)).^2);
    grad(i,1)=(1/m)*sum((dS-h(:,1)).*(S.*I)+(dI-h(:,2)).*(S.*I));
    grad(i,2)=(1/m)*sum((dI-h(:,2)).*I);
    lambda=lambda-alpha*grad(1);
    mu=mu-alpha*grad(2);
end
%plot(1:N,J);
%hold on;
J_f=J(N);
end