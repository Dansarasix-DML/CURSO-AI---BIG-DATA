hombre(fernandoI).
hombre(leandroI).
hombre(fernandoII).
hombre(miguelII).
hombre(fernandoIII).
hombre(juanIII).
hombre(miguelIV).
hombre(tomasIV).
hombre(juanIV).
hombre(ignacioIV).
hombre(joseII).
hombre(joseIII).

mujer(carmenI).
mujer(mercedesII).
mujer(mercedesI).
mujer(mercedesIII).
mujer(palomaII).
mujer(carmenII).
mujer(victoriaII).
mujer(montserratII).
mujer(isabelIII).
mujer(idoiaIII).
mujer(paulaIV).
mujer(noraIV).
mujer(marinaIV).


% relaciones de progenitura
progenitor(fernandoI, fernandoII).
progenitor(fernandoI, palomaII).
progenitor(fernandoI, carmenII).
progenitor(fernandoI, victoriaII).
progenitor(fernandoI, montserratII).
progenitor(carmenI, fernandoII).
progenitor(carmenI, palomaII).
progenitor(carmenI, carmenII).
progenitor(carmenI, victoriaII).
progenitor(carmenI, montserratII).
progenitor(leandroI, miguelII).
progenitor(leandroI, mercedesII).
progenitor(mercedesI, miguelII).
progenitor(mercedesI, mercedesII).
progenitor(carmenII, fernandoIII).
progenitor(carmenII, juanIII).
progenitor(miguelII, fernandoIII).
progenitor(miguelII, juanIII).
progenitor(fernandoIII, miguelIV).
progenitor(fernandoIII, tomasIV).
progenitor(isabelIII, miguelIV).
progenitor(isabelIII, tomasIV).
progenitor(juanIII, juanIV).
progenitor(juanIII, ignacioIV).
progenitor(idoiaIII, juanIV).
progenitor(idoiaIII, ignacioIV).
progenitor(mercedesII, mercedesIII).
progenitor(joseII, mercedesIII).
progenitor(mercedesII, joseIII).
progenitor(joseII, joseIII).
progenitor(mercedesIII, paulaIV).
progenitor(joseIII, noraIV).
progenitor(joseIII, marinaIV).

% relaciones de matrimonio
matrimonio(carmenI, fernandoI).
matrimonio(mercedesI, leandroI).
matrimonio(carmenII, miguelII).
matrimonio(isabelIII, fernandoIII).
matrimonio(idoiaIII, juanIII).
matrimonio(mercedesII, joseII).

% relaciones de parentesco
padre(Padre, Hijo):-hombre(Padre), progenitor(Padre, Hijo).
madre(Madre, Hijo):-mujer(Madre), progenitor(Madre, Hijo).

es_padre(Progenitor, Hijo):-
    padre(Progenitor, Hijo); madre(Progenitor, Hijo).

son_pareja(Marido, Mujer):-
    matrimonio(Marido, Mujer); matrimonio(Mujer, Marido).

hermanos(Hermano1, Hermano2):-progenitor(Progenitor, Hermano1),
    progenitor(Progenitor, Hermano2), not(Hermano1==Hermano2).

hermano(Hermano1, Hermano2):-hombre(Hermano1), hermanos(Hermano1, Hermano2).
hermana(Hermano1, Hermano2):-mujer(Hermano1), hermanos(Hermano1, Hermano2).

esposo(Mujer, Marido):-matrimonio(Mujer, Marido), hombre(Marido).
esposa(Mujer, Marido):-matrimonio(Mujer, Marido), mujer(Mujer).

nieto(Nieto, Abuelos):-progenitor(Abuelos, Padres), progenitor(Padres, Nieto), hombre(Nieto).
nieta(Nieta, Abuelos):-progenitor(Abuelos, Padres), progenitor(Padres, Nieta), mujer(Nieta).

suegro(Suegro, Persona):- 
    padre(Suegro, Esposo), 
    son_pareja(Persona, Esposo).

suegra(Suegra, Persona):- 
    madre(Suegra, Esposo), 
    son_pareja(Persona, Esposo).

yerno(Yerno, Persona):- 
    son_pareja(Yerno, Hijo),
    progenitor(Persona, Hijo),
    hombre(Yerno).

nuera(Nuera, Persona):- 
    son_pareja(Nuera, Hijo), 
    progenitor(Persona, Hijo), 
    mujer(Nuera).

cuñado(Cuñado, Persona):- 
    (son_pareja(Persona, Pareja), hermanos(Cuñado, Pareja); hermanos(Hermano, Persona), son_pareja(Cuñado, Hermano)), 
    hombre(Cuñado).

cuñada(Cuñada, Persona):- 
    (son_pareja(Persona, Pareja), hermanos(Cuñada, Pareja); hermanos(Hermana, Persona), son_pareja(Cuñada, Hermana)), 
    mujer(Cuñada).

tio(Tio, Sobrino):- 
    es_padre(Padre, Sobrino), hermano(Tio, Padre).

tia(Tia, Sobrino):- 
    es_padre(Padre, Sobrino), hermana(Tia, Padre).

primo(Primo, Persona):- 
    es_padre(P1, Persona), hermanos(P1, P2), es_padre(P2, Primo), hombre(Primo).

prima(Prima, Persona):- 
    es_padre(P1, Persona), hermanos(P1, P2), es_padre(P2, Prima), mujer(Prima).
