% Main script for estimation of parmeters
% ------------------------------------
% The variables are - 
% S -- The number of susceptibles
% I -- An array of infected people on each day
% I0 -- Number of infected people initially
% R -- An array of recovered people on each day
% N -- The total population (S+I+R)
% maxiters -- The maximum number of iteration for the fminsearch function
% b0 -- An array containing the initial values of beta,gamma with total population and I0
% nday -- total number of days
% ------------------------------------
% Functions used are - 
% iniGuess -- Function for inital guess of parameters
% parest -- Function for estimating the parameters

global S I R N   
global maxiters I0 
load('data.mat')

maxiters = 10000;           %max number of iterations
    
b0 = iniGuess();            %initial guess  

beta = b0(1);               %getting the initial guessed beta 
gamma = b0(2);              %getting the initial guessed gamma
I0 = I(1);                  %getting initial number of infecteds from cases on day 1

    
% set infection rate and time intervals 
dS  = diff(S);              %difference between subsequent values of Susceptibles
dS(dS<0) = 0;               %if difference is negative then make it 0
dI  = diff(I);              %difference between subsequent values of Infecteds
dI(dI<0) = 0;               %if difference is negative then make it 0
dR  = diff(R);              %difference between subsequent values of Recovered
dR(dR<0) = 0;               %if difference is negative then make it 0

nday = length(I);           %total number of days
tt   = 0:nday-1;            %time span 
    
b0 = [beta gamma N I0]';    %initial estimate i.e guess
   
b = parest(b0);             %function for parameter estimation
    
beta  = b(1)                %final estimated value of beta
gamma = b(2)                %final estimated value of gamma
%N     = b(3);
%I0    = b(4);

    