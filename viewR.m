function []= viewR(mu,I,R)
m=length(R);
dR1=mu*I;
R1=i_dt(dR1,R(1));
plot(1:m,R,'kx');
hold on;
plot(1:m,R1,'-k');
hold on;
end