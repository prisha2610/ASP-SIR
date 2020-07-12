% Function used for optimization and finding the solution for beta and gamma
% ------------------------------------
% The variables used are -
% S -- The number of susceptibles
% I -- The number of infecteds
% I0 -- Number of infected people initially
% R -- The number of recovered people
% N -- The total population
% tspan -- The total number of days of the pandemic
% m -- The number of infected people
% f -- The mean squared error
% 
function f = optim_fun(params)  
    global S I R N         
    tspan = 0:length(I)-1;          % set time span
     %solve ODE
    try
        warning('off')
    [tsol,sol] = ode45(@(t,vars) de_sir(t,vars,params), tspan, [S(41),I(41),R(41)]);
        warning('on')
    catch
        f=NaN;
        warning('on')
        return
    end
    % check if calculation time equals sample time
    if length(tsol) ~= length(tspan)
        f = NaN;
        return
    end
    % cleaning data 
    infected = I;                     
    susceptible = S;
    recovered = R;
    infected(isnan(I)) = [];         
    recovered(isnan(R)) = [];
    %sol(isnan(I)) = [];        
    infected = infected';      
    
    m = length(infected);
    sol;
    % calculate optimization function
    f1 = norm((infected - sol(:,2))) + norm((susceptible - sol(:,1))); % + norm((recovered - sol(:,3)));
    f =  f1/m;
end