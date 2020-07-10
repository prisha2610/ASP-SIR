function p = P_majOutBr(I0,R0)

p=0;    %indicates only minor outbreak occurs

%I0=initial infected population
%R0=basic reproduction number
if R0>1 %derivation of condition from branching process assumption
    p=1-(1/R0)^I0;  %indicates probability of major outbreak occuring
end

end
