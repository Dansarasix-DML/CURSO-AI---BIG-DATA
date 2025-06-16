% --- Hechos base y predicados principales ---

% Predicado principal para decidir si se concede el crédito
% concede_credito(+Edad, +Nomina, +TipoContrato, +DuracionContrato, +DuracionPrestamo)
concede_credito(Edad, si, indefinido, _, _) :-
    Edad >= 18.

concede_credito(Edad, si, temporal, DuracionContrato, DuracionPrestamo) :-
    Edad >= 18,
    DuracionContrato >= DuracionPrestamo.

% Casos en los que se rechaza
concede_credito(_, no, _, _, _) :- 
    writeln('Crédito rechazado: no tiene nómina'), fail.

concede_credito(Edad, _, _, _, _) :-
    Edad < 18,
    writeln('Crédito rechazado: menor de edad'), fail.

concede_credito(_, _, temporal, DuracionContrato, DuracionPrestamo) :-
    DuracionContrato < DuracionPrestamo,
    writeln('Crédito rechazado: contrato temporal insuficiente'), fail.
