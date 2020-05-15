function [lambda,mu,J_f]=deterministic(S,I,R,alpha,N)
%S=(S-mean(S)) ./ std(S);
%I=(I-mean(I)) ./ std(I);
dS=d_dt(S);
%dI=d_dt(I);
dR=d_dt(R);

m=length(dS);
lambda=0;
mu=0;
grad=zeros(2,1);
J=zeros(N,2);

for i=1:N
    h=[-lambda*(S.*I) , lambda*(S.*I)-mu*I , mu*I];
    J(i,1)=(1/(2*m))*sum((h(:,1)-dS).^2); %+(h(:,2)-dI).^2
    J(i,2)=(1/(2*m))*sum((h(:,3)-dR).^2);
    grad(1)=(1/m)*sum((-h(:,1)+dS)'*(S.*I));            %+h(:,2)-dI
    grad(2)=(1/m)*sum((h(:,3)-dR)'*I);                 %-h(:,2)+dI
    lambda=lambda-alpha(1)*grad(1);
    mu=mu-alpha(2)*grad(2);
end
hold off;
%plot(1:N,J(:,1),'-b');
%hold on;
J_f=J(N,:);
end