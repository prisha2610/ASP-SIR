function[P]=stochastic(lambda,mu,n,m)

T=m*24*60;
s=n;
i=1;
r=0;
P=zeros(2,1);

for t=1:T
    P(1)=(lambda/24)*s*i;
    P(2)=(mu/24)*i;
    p=rand();
    if p>0.5&&p<0.5+P(2)&&i>1
        i=i-1;
        r=r+1;
    elseif p<0.5&&p>=0.5-P(1)&&s>0
        s=s-1;
        i=i+1;
    end
    plot(t,i,'xr')
    hold on;
    plot(t,r,'xk')
    hold on;
end
end