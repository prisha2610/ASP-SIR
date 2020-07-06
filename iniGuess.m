function [b0] = iniGuess(C)
b0=[];
beta = rand;            %random value of beta 
%beta = beta +1;         
gamma = rand;           %random value of beta 
%gamma=gamma+1;         
b0 = [beta gamma];
end
