function flag = det_eq(S0,N,R0)

if S0*R0/N<=1
    flag=0;
    disp('Disease-free equilibrium');
else
    flag=1;
    disp('Epidemic');
    
end
