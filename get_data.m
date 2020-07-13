% Script for setting up the data
% ------------------------------------
% The variables used are -
% S -- Susceptible population
% I -- Infected population
% R -- Removed population
% N -- Total population
% days -- Total number of days for which data is available
% phase -- Time period studied
% x -- Start index of time period
% y -- End index of time period
% i -- Initial number of infectives
% f1 -- Figure for showing actual data
% ------------------------------------

global S I R
global N days phase x y i
global f1

T=readtable('date-India-confirmed-recovered-dead.csv');
N=136641750;

R=T.r+T.d;
I=T.c-T.r-T.d;
S=N-T.c;
days=height(T);

phase=input('0. Uptil now\n1. Pre-Nationwide Lockdown\n2. Lockdown Period\n3. Post-Nationwide Lockdown\n');
switch phase
    case 1
        x=41;
        y=63;
        i=I(41);
    case 2
        x=64;
        y=131;
        i=I(64);
    case 3
        x=132;
        y=days;
        i=I(132);
    case 0
        x=41;
        y=days;
        i=I(41);
end

f1=figure;
plot(x:y,I(x:y),'-k');
hold on;
legend('Actual');
title('Actual data + Models');
xlabel('#Days');
ylabel('Infected population');