%This is the fuction file for CSTR at steadty stt
%Vector of outputs : f = [dCa/dt ; dTdt]
%Vector of i/p : x = [Ca;T]

function f = cstr_func(x)
    global k0 H_rxn rhoCp UA_by_V E R F_by_V Caf Tf Tj;

    %Model Eq 
    rate = k0.*exp(-E./(R.*x(2))).*x(1);
    f(1,1) = (F_by_V).*(Caf-x(1)) - rate;
    f(2,1) = (F_by_V).*(Tf-x(2)) + (H_rxn/rhoCp).*rate-(UA_by_V/rhoCp).*(x(2)-Tj);
end

