function [b,fminval,flag] = parest(b0)
%Function for Parameter estimation
   global maxnum       %number if iterations for fminsearch
    
           options = optimset('Display','off','MaxIter',maxnum,...
            'MaxFunEvals',maxnum,'TolFun',1e-12);
  
   [b, fminval,flag] = fminsearch(@fun, [b0(1),b0(2)], options);
   warning('off')
end