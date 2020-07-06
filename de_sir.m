function diffeqs = de_sir(t,vars,params)
global N
S = vars(1);
I = vars(2);
R = vars(3);

beta  = params(1);
gamma = params(2);
%N     = params(3);
%I0    = params(4);

diffeqs(1,1) = (-1)*beta*S*I;
diffeqs(2,1) = ((beta*S*I)/N) - (gamma*I);
diffeqs(3,1) = gamma*I;

end

