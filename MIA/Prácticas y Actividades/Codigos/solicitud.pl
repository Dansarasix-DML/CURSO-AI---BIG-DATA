% Datos del solicitante: promedio, puntaje_SAT, extracurriculares, talento_especial, circunstancia_unica
% Todos los valores son simbolizados para facilidad de evaluación

solicitante(
    nombre("Juan Perez"),
    promedio(88),
    sat(1300),
    extracurriculares(si),
    talento(no),
    circunstancia(no)
).


% Regla 1: Criterios completos
evaluar(Nombre, aceptar) :-
    solicitante(nombre(Nombre), promedio(P), sat(SAT), extracurriculares(si), talento(_), circunstancia(_)),
    P >= 85,
    SAT >= 1200.

% Regla 2: Buen desempeño pero sin extracurriculares
evaluar(Nombre, evaluar_adicional) :-
    solicitante(nombre(Nombre), promedio(P), sat(SAT), extracurriculares(no), talento(_), circunstancia(_)),
    P >= 85,
    SAT >= 1200.

% Regla 3: Talento especial compensa deficiencias
evaluar(Nombre, evaluar_especial) :-
    solicitante(nombre(Nombre), promedio(P), sat(SAT), extracurriculares(_), talento(si), circunstancia(_)),
    (P < 85 ; SAT < 1200).

% Regla 4: Circunstancia única válida
evaluar(Nombre, comite) :-
    solicitante(nombre(Nombre), promedio(_), sat(_), extracurriculares(_), talento(_), circunstancia(si)).

% Regla 5: No cumple con requisitos mínimos
evaluar(Nombre, rechazar) :-
    solicitante(nombre(Nombre), promedio(P), sat(SAT), extracurriculares(no), talento(no), circunstancia(no)),
    P < 85,
    SAT < 1200.
