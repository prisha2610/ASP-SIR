m=size(mhcovid1,1);
N=112374333;

a=0; %rate of infection
b=0; %rate of removal

S=ones(m,1);
S(1)=N; %2011 census

I=mhcovid1(:,3);
rcvr=mhcovid1(:,1);
dead=mhcovid1(:,2);
R=rcvr+dead;

for i=2:m
    S(i)=S(i-1)-I(i)-R(i);
end

plot(1:m,I,'xr');
hold on;
plot(1:m,rcvr,'xb');
hold on;
plot(1:m,dead,'xk');
hold on;

for i=1:m-1
    a=a+(S(i)-S(i+1))/(S(i)*I(i));
    b=b+(R(i+1)-R(i))/I(i);
end

a=a/m;
b=b/m;

S1=zeros(m,1);
I1=ones(m,1);
R1=zeros(m,1);
S1(1)=N;
for i=1:m-1
    
end
