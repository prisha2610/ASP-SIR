%Script for estimating parameters
% ------------------------------------
% The functions used are-
% iniGuess -- Function for inital guess of parameters
% fminsearch -- An optimizer provided by MATLAB for minimizing the value of optim_fun
% optim_fun -- The function to optimize
% ------------------------------------
% The variables are - 
% maxiters -- Maximum number of iteration for the fminsearch function
% b0 -- Array containing the initial values of beta and gamma
% options -- Setting attributes for fminsearch
% b -- Values of the parameters with minimum loss
% fminval -- Minimum value of error found
% flag -- Status of fminsearch:
%         1 if minimum is reached, 0 if minimum not reached, -1 if error function not convergent 
% beta -- Estimated value of transmission parameter 
% gamma -- Estimated value of removal parameter
% ------------------------------------

b0 = iniGuess();

maxiters = 10000;

options = optimset('Display','off','MaxIter',maxiters,...
            'MaxFunEvals',maxiters,'TolFun',1e-12,'TolX',1e-12);
   
[b, fminval,flag] = fminsearch(@optim_fun, b0, options);
warning('on')

beta=b(1);
gamma=b(2);

clear b 
