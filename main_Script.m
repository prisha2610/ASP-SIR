% Main Script to be executed
% Saves plots and displays attributes
% ------------------------------------
% The variables used are -
% N -- Total population
% days -- Total number of days for which data is available
% x -- Start index of time period
% y -- End index of time period
% i -- Initial number of infectives
% beta -- Estimated value of transmission parameter 
% gamma -- Estimated value of removal parameter
% flag -- Epidemic status according to Deterministic Theorem
% p -- Probability of a major outbreak
% f_spread -- Total cases according to simulation
% f1 -- Figure for showing actual data + ODE
% f2 -- Figure for showing ODE over longer period of time
% f3 -- Figure for showing EM-plot over longer period of time
% ------------------------------------
% The functions used are -
% det_ode -- ODE plot
% isEpidemic --
% P_majOutBr --
% EM_method -- EM Method simulation
% gillespie -- Gillespie Algorithm simulation
% get_data -- Setting up actual data
% view_data -- Plotting actual data
% parest -- Estimatation of beta and gamma
% ------------------------------------

global days beta gamma
global x y i 
global I N date
global f1 f2 f3

close all
beta=0.1;
gamma=0.08;
N=1000;
i=5;
x=1;
days=375;
y=days*4;
f_spread=det_ode;
flag=isEpidemic;
p=P_majOutBr;
disp("Theoretical");
disp("N="+N+"    Initial Infectives="+i);
disp("Start Date:"+x+"    End Date:"+y)
disp("Transmission Rate(Beta)="+beta+"    Removal Rate(Gamma)="+gamma)
disp("Probabilty of major outbreak="+p);
if flag
    disp("Deterministic Status: Epidemic");
else
    disp("Deterministic Status: Disease-free equilibrium");
end
disp("Total simulated number of cases="+f_spread);
disp(" ");
EM_method;
gillespie;
saveas(f2,'ODE_theory.png');
saveas(f3,'EM_theory.png')
saveas(f1,'Gillespie_theory.png')

get_data;

days=length(I);

close all
x=43;
y=64;
i=I(x);
view_data;
[beta,gamma]=parest;
det_ode;
disp("COVID-19 in India - Phase 1 Analysis")
disp("Total population="+N+"    Initial Infectives="+i);
disp("Start Date:"+date(x)+"    End Date:"+date(y)+...
    "    Transmission Rate(Beta)="+beta+"    Removal Rate(Gamma)="+gamma);
disp("Probabilty of major outbreak="+p);
if flag
    disp("Deterministic Status: Epidemic");
else
    disp("Deterministic Status: Disease-free equilibrium");
end
disp("Total simulated number of cases="+f_spread);
disp(" ");
gillespie;
EM_method;
saveas(f1,'Estimation_1.png');
saveas(f2,'ODE_1.png');
saveas(f3,'EM_1.png');

close all
x=64;
y=131;
i=I(x);
view_data;
[beta,gamma]=parest;
det_ode;
disp("COVID-19 in India - Phase 2 Analysis")
disp("Total population="+N+"    Initial Infectives="+i);
disp("Start Date:"+date(x)+"    End Date:"+date(y)+...
    "    Transmission Rate(Beta)="+beta+"    Removal Rate(Gamma)="+gamma);
disp("Probabilty of major outbreak="+p);
if flag
    disp("Deterministic Status: Epidemic");
else
    disp("Deterministic Status: Disease-free equilibrium");
end
disp("Total simulated number of cases="+f_spread);
disp(" ");
%gillespie;
EM_method;
saveas(f1,'Estimation_2.png');
saveas(f2,'ODE_2.png');
saveas(f3,'EM_2.png');

close all
x=131;
y=days;
i=I(x);
view_data;
[beta,gamma]=parest;
det_ode;
disp("COVID-19 in India - Phase 3 Analysis")
disp("Total population="+N+"    Initial Infectives="+i);
disp("Start Date:"+date(x)+"    End Date:"+date(y)+...
    "    Transmission Rate(Beta)="+beta+"    Removal Rate(Gamma)="+gamma);
disp("Probabilty of major outbreak="+p);
if flag
    disp("Deterministic Status: Epidemic");
else
    disp("Deterministic Status: Disease-free equilibrium");
end
disp("Total simulated number of cases="+f_spread);
disp(" ");
%gillespie;
EM_method;
saveas(f1,'Estimation_3.png');
saveas(f2,'ODE_3.png');
saveas(f3,'EM_3.png');

close all
x=43;
y=days;
i=I(x);
view_data;
[beta,gamma]=parest;
det_ode;
disp("COVID-19 in India - Overall Analysis");
disp("Total population="+N+"    Initial Infectives="+i);
disp("Start Date:"+date(x)+"    End Date:"+date(y)+...
    "    Transmission Rate(Beta)="+beta+"    Removal Rate(Gamma)="+gamma);
disp("Probabilty of major outbreak="+p);
if flag
    disp("Deterministic Status: Epidemic");
else
    disp("Deterministic Status: Disease-free equilibrium");
end
disp("Total simulated number of cases="+f_spread);
%gillespie;
EM_method;
saveas(f1,'Estimation_overall.png');
saveas(f2,'ODE_overall.png');
saveas(f3,'EM_overall.png');
