function []=viewS(lambda,S,I)
m=length(S);
dS1=-lambda*(S.*I);
S1=i_dt(dS1,S(1));
plot(1:m,S,'bx');
hold on;
plot(1:m,S1,'-b');
hold on;
end