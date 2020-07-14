% Gillespie Algorithm
% ------------------------------------
% The variables used are -
% t -- Time-steps
% s -- Susceptible individuals at particular time step
% I -- Infected individuals at each time step
% u -- Vector of 2 uniformly random numbers to simulate intervent time and event occurence
% lambda -- total rate of either event occurring
% ------------------------------------
% The functions used are -
% rand -- Uniformly random generator ~ U(0,1)
% ------------------------------------

function [] = gillespie()

    global N beta gamma
    global i x y 
    global f1

    t=x;                                    %initial time
    S=N-i;                                  %initial susceptible population 
    I=i;                                    %initial susceptible population

    while(t(1)<y && I(1)~=0)                %time for occurence of event can't exceed total time
        u=rand(2,1);
        lambda=(beta*S(1)*I(1))/N+gamma*I(1); 
        t =[t(1)-log(u(1))/lambda; t];      %simulation of time at which next event occurs
        if u(2)<=beta*S*I(1)/(N*lambda)     %condition for transmission to occur
            if S(1)~=0
                S=[S(1)-1; S];
                I=[I(1)+1; I];
            else
                S=[S(1); S];
                I=[I(1); I];
            end
        else                                %condition for removal to occur
            S=[S(1); S];
            I=[I(1)-1; I];
        end
    end
    t=[y; t];
    S=[S(1); S];
    I=[I(1); I];

    figure(f1);

    if x==1 && y==800
        plot(t,S,'-b','DisplayName','Gillespie S');
        hold on;
        plot(t,I,'-r','DisplayName','Gillespie I');
        plot(t,N-S-I,'-g','DisplayName','Gillespie R');
        xlabel('#Days');
        ylabel('Population');
    else
        plot(t,I,'-y','DisplayName','Gillespie Algo');
    end

end