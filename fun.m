function f = fun(params)
%FUN Optimization function  
    global C %dC
    global N I0
    
    w1=1;
    w2=1;
    
    tspan = 0:length(C)-1;          % set time span
    % solve ODE
    try
        warning('off')
        [tsol,Csol] = ode45(@(t,vars) de_sir(t,vars,params), tspan, [N,I0,1]);
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
    Cc = C;
    Cs = N - C;
    Cc(isnan(C)) = [];
    Csol(isnan(C)) = [];
    Cc = Cc';
    
    % calculate optimization function
    c1 = w1/(w1 + w2);
    c2 = w2/(w1 + w2);
    f1 = 0;
    f2 = 0;
    if c2 > 0
        f2 = norm((diff(Cc) - diff(Csol(:,2)))) + norm((diff(Cs) - diff(Csol(:,1))));
    end
    if c1 > 0
        f1 = norm((Cc - Csol(:,2))) + norm((Cs - Csol(:,1)));
    end
    f =  f1; %c1*f1 +  c2*f2;
end