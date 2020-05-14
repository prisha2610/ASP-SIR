function V=i_dt(dV,a)
m=size(dV);
V=a*ones(m);
for i=2:m
    V(i)=V(i-1)+dV(i);
end
end