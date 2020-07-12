function [b0] = iniGuess()
b0=[];
beta = rand;            %random value of beta 
gamma = rand;           %random value of beta 
b0 = [beta gamma];
end
