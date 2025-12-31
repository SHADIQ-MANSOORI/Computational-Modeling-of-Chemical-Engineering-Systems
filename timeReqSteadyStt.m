%this code determines the time requiremnt for the system to reach the
%steady state cocnc in the cascade CSTR system 

clc 
clear 
close all

t_final = 60; %in min
grad_tol = 0.001; % tolerence for the gradient

[tsol, Csol] = ode45(@cstr,[0 t_final],[0 0 0 0]);
t_fine = 0:1:t_final;
C_fine = interp1(tsol,Csol,t_fine,'spline');
% gradient operator to calcuate the derivative at each value , but this
% gradient operator need equally spaced data. So we use the interploation
% as done above to get the data which is equi space 
grad_arr = cat(2,transpose(t_fine),gradient(C_fine(:,1)),gradient(C_fine(:,2)),gradient(C_fine(:,3)),gradient(C_fine(:,4)));
A = grad_arr < grad_tol; %generates the logic table in give matrix which have 0's and 1's , 1 for the true and 0 for false 
summ = cat(2,transpose(t_fine),sum(A,2));
B = summ(:,2)==4; %if all the entries in the row become 1 then we get the steady state there fore we seek row sum to be 4
t_ss = min(summ(B));
fprintf('THe system will reach the steady state at %f',t_ss)
fprintf('\n')
