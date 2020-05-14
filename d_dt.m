function dV=d_dt(V)
m=length(V);
dV=zeros(m,1);
dV(1)=0;        %%%%%
for t=2:m
    dV(t)=V(t)-V(t-1);
end
end