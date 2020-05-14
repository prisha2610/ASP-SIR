function []=viewI(lambda,mu,S,I)
m=length(I);
dI1=lambda*(S.*I)-mu*I;
I1=i_dt(dI1,I(1));
plot(1:m,I,'rx');
hold on;
plot(1:m,I1,'-r');
hold on;
end