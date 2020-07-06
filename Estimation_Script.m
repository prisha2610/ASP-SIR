global C dC
global maxnum
global N I0
[C,date0] = getData();
N = 12e6;                   %max. population size
maxnum = 10000;              %max number of iterations
day = [];                   %end day
    
date00 = date0;
C00 = C;
    
b0 = iniGuess(C);           % initial guess  

beta = b0(1);               %getting the initial guessed beta 
gamma = b0(2);              %getting the initial guessed gamma
I0 = C(1);                  %getting initial number of infecteds from cases on day 1

    
% set infection rate and time intervals 
dC  = diff(C);              %difference between subsequent values of Cases
dC(dC<0) = 0;               %if difference is negative then make it 0
nday = length(C);           %total number of days
tt   = 0:nday-1;            %time span 
    
b0 = [beta gamma N I0]';    %initial estimate i.e guess
   
b = parest(b0);             %function for parameter estimation
    
beta  = b(1)               %final estimated value of beta
gamma = b(2)               %final estimated value of gamma
%N     = b(3);
%I0    = b(4);

    