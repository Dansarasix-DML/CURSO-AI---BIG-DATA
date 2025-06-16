% Hechos: información del paciente (ejemplo)
paciente(glucosa_alta).
paciente(mayor_de_45).
paciente(imc_alto).
paciente(antecedentes_familiares).
paciente(sintomas_diabetes).

% Reglas
riesgo_alto :- 
    paciente(glucosa_alta).

riesgo_alto :- 
    factores_de_riesgo(F),
    length(F, N),
    N >= 3.

riesgo_moderado :- 
    \+ riesgo_alto,
    (
        paciente(mayor_de_45), 
        paciente(imc_alto)
    ).

riesgo_moderado :- 
    \+ riesgo_alto,
    paciente(antecedentes_familiares).

riesgo_moderado :- 
    \+ riesgo_alto,
    paciente(sintomas_diabetes).

riesgo_bajo :- 
    \+ riesgo_alto,
    \+ riesgo_moderado.

% Utilidad: lista de factores presentes
factores_de_riesgo(Factores) :-
    findall(Factor,
            (member(Factor, [mayor_de_45, imc_alto, antecedentes_familiares, sintomas_diabetes]),
             paciente(Factor)),
            Factores).

% Diagnóstico general
diagnostico(Riesgo) :- 
    (riesgo_alto -> Riesgo = 'Alto';
     riesgo_moderado -> Riesgo = 'Moderado';
     riesgo_bajo -> Riesgo = 'Bajo').
