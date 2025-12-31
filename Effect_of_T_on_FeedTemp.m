clc 
clear
close all

global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tj

%Parameter Set1 
F_by_V = 1; k0 = 14825*3600; H_rxn = 5215; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 250; Tj = 25+273; R = 1.98;

%Parameter Set2
F_by_V = 1; k0 = 9703*3600; H_rxn = 5960; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 150; Tj = 25+273; R = 1.98;

%Parameter Set3
F_by_V = 1; k0 = 18194*3600; H_rxn = 8195; E = 11843; rhoCp = 500; Caf = 10; UA_by_V = 750; Tj = 25+273; R = 1.98;

T_reactor = 300:1:400;
Tfss = cstr_curve2(T_reactor);
plot(Tfss,T_reactor,'LineWidth',2)
xlabel('T_f (K)')
ylabel('T (K)')

%------------------Fuction to calculate i/o curve----------------------%

function Tfss = cstr_curve2(Temp_Vec)

    global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tj

    for i = 1:length(Temp_Vec)
        T = Temp_Vec(i);
        k = k0.*exp(-E./(R.*T));
        Ca = F_by_V*Caf/(F_by_V+k);
        rate = k*Ca;
        term2 = rate*H_rxn/rhoCp;
        term3 = (UA_by_V/rhoCp)*(T-Tj);
        Tfss(i) = T + (term3 - term2)/(F_by_V);
    end

end
