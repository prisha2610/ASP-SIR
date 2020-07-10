function flag = isEpidemic(S0,N,R0)

flag=0; %indicates disease-free equilibrium

%S0=initial susceptible population
%R0=basic reproduction number
%N=total initial populations

if S0*R0/N>1    %condition obtained from theorem
    flag=1; %indicates epidemic
end

end
