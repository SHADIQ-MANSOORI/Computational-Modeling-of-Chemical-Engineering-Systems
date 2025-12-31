clc
clear 
close all

global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tf Tj;

Guess1 = [9;30]; Guess2 = [5;350]; Guess3 = [1;450];

%parameter set 1

F_by_V = 1 ; k0 = 14825*3600 ; H_rxn = 5215; E = 11843; rhoCp = 500 ;
Tf = 25+273 ; Caf = 10; UA_by_V = 250; Tj = 25+273; R = 1.98;

%solution set for each guess set 
xsol11 = fsolve(@cstr_func,Guess1,optimoptions('fsolve','MaxIterations',1000,'MaxFunctionEvaluations',2000,'Display','iter'));
xsol21 = fsolve(@cstr_func,Guess2,optimoptions('fsolve','MaxIterations',1000,'MaxFunctionEvaluations',2000,'Display','iter'));
xsol31 = fsolve(@cstr_func,Guess3,optimoptions('fsolve','MaxIterations',1000,'MaxFunctionEvaluations',2000,'Display','iter'));

%Arranging the obtained results in the form of a table 
Ca_solved1 = round([xsol11(1); xsol21(1); xsol31(1)],2,"significant");
T_solved1 = round([xsol11(2); xsol21(2); xsol31(2)],2,'significant');
Guess = ["Guess 1";"Guess 2";"Guess 3"];
fprintf("For Paramter Set 1:")
table(Guess,Ca_solved1,T_solved1)

%----------------------------------------------------------------------%



%parameter Set2 

F_by_V = 1 ; k0 = 9703*3600 ; H_rxn = 5960; E = 11843; rhoCp = 500 ;
Tf = 25+273 ; Caf = 10; UA_by_V = 150; Tj = 25+273; R = 1.98;

%soltion Set for each guess
xsol11 = fsolve(@cstr_func,Guess1);
xsol21 = fsolve(@cstr_func,Guess2);
xsol31 = fsolve(@cstr_func,Guess3);

%Arranging the obtained results in the form of table 
Ca_solved2 = round([xsol11(1);xsol21(1);xsol31(1)],2,'significant');
T_solved2 = round([xsol11(2);xsol21(2);xsol31(2)],2,"significant");

fprintf("For Paramter Set 2:")
table(Guess,Ca_solved2,T_solved2)

%----------------------------------------------------------------------%

%parameter Set3

F_by_V = 1 ; k0 = 18194*3600 ; H_rxn = 8195; E = 11843; rhoCp = 500 ;
Tf = 25+273 ; Caf = 10; UA_by_V = 750; Tj = 25+273; R = 1.98;

%soltion Set for each guess
xsol11 = fsolve(@cstr_func,Guess1);
xsol21 = fsolve(@cstr_func,Guess2);
xsol31 = fsolve(@cstr_func,Guess3);

%Arranging the obtained results in the form of table 
Ca_solved3 = round([xsol11(1);xsol21(1);xsol31(1)],2,'significant');
T_solved3 = round([xsol11(2);xsol21(2);xsol31(2)],2,"significant");

fprintf("For Paramter Set 3:")
table(Guess,Ca_solved3,T_solved3)

%---------------X-------------------------------X----------------------%