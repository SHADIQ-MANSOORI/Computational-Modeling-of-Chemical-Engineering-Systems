%this code calculate steady state conc 

clc
clear 
close all

Csol = fsolve(@cstr_ss,[0 0 0 0]);
disp('Steady State Concentration in mol/Lit: ')
CA1 = Csol(1);
CB1 = Csol(2);
CA2 = Csol(1);
CB2 = Csol(2);

fprintf('The Steady State Conc of C_A in reator 1 is %f',CA1)
fprintf('\nThe Steady State Conc of C_B in reator 1 is %f',CB1)
fprintf('\nThe Steady State Conc of C_A in reator 2 is %f',CA2)
fprintf('\nThe Steady State Conc of C_B in reator 2 is %f',CB1)

function f = cstr_ss(C)
%C(1) = CA1 ; C(2) = CB1 ; C(3) = CA2 ; C(4) = CB2
k = 0.12;
tau = 5;
CA0 = 20;
f(1,1) = (1/tau)*(CA0-C(1)-(k*C(1)));
f(2,1) = (-1/tau)*C(2) + (k*C(1));
f(3,1) = (1/tau)*(C(1)-C(3))-(k*C(3));
f(4,1) = (1/tau)*(C(2)-C(4)) + (k*C(3));
end