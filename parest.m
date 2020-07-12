%Function for estimating parameters
% ------------------------------------
% The variables used are-
% # maxiters -- Maximum number of iterations for the fminsearch optimizer
% # b -- The values of the parameters with minimum loss
% # fminval -- The minimum value of error found
% ------------------------------------
% The functions used are-
% fminsearch -- An optimizer provided by MATLAB for minimizing the value of
% optim_fun -- The function to optimize
function [b,fminval,flag] = parest(b0)
%Function for Parameter estimation
   global maxiters       %number if iterations for fminsearch
    
           options = optimset('Display','off','MaxIter',maxiters,...
            'MaxFunEvals',maxiters,'TolFun',1e-12,'TolX',1e-12);
   [b, fminval,flag] = fminsearch(@optim_fun, [b0(1),b0(2)], options);
   %flag
   warning('on')
end