% Function for setting the SIR model
% ------------------------------------
% The varibles are - 
% t -- Time-steps
% y -- [S;I]
% beta -- Rate of transmission
% gamma -- Rate of removal
% N -- Total population
% dy -- [dS;dI]
% ------------------------------------

function dy = odefunc(t,var,beta,gamma)

global N

dy=zeros(2,1);

dy(1)=-(beta/N)*var(1)*var(2);              %dS=-(beta/N)*s*i
dy(2)=(beta/N)*var(1)*var(2)-gamma*var(2);    %dI=(beta/N)*s*i-gamma*i

end