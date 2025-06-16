hombre(fernandoI).
hombre(leandroI).
hombre(fernandoII).
hombre(miguelII).
hombre(mercedesII).
hombre(fernandoIII).
hombre(juanIII).
hombre(miguelIV).
hombre(tomasIV).
hombre(juanIV).
hombre(ignacioIV).

mujer(carmenI).
mujer(mercedesI).
mujer(palomaII).
mujer(carmenII).
mujer(victoriaII).
mujer(montserratII).
mujer(isabelIII).
mujer(idoiaIII).


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

% relaciones de matrimonio
matrimonio(carmenI, fernandoI).
matrimonio(mercedesI, leandroI).
matrimonio(carmenII, miguelII).
matrimonio(isabelIII, fernandoIII).
matrimonio(idoiaIII, juanIII).

% relaciones de parentesco
padre(Padre, Hijo):-hombre(Padre), progenitor(Padre, Hijo).
madre(Madre, Hijo):-mujer(Madre), progenitor(Madre, Hijo).

hermanos(Hermano1, Hermano2):-progenitor(Progenitor, Hermano1),
    progenitor(Progenitor, Hermano2), not(Hermano1==Hermano2).

hermano(Hermano1, Hermano2):-hombre(Hermano1), hermanos(Hermano1, Hermano2).
hermana(Hermano1, Hermano2):-mujer(Hermano1), hermanos(Hermano1, Hermano2).

esposo(Mujer, Marido):-matrimonio(Mujer, Marido), hombre(Marido).
esposa(Mujer, Marido):-matrimonio(Mujer, Marido), mujer(Mujer).

nieto(Nieto, Abuelos):-progenitor(Abuelos, Padres), progenitor(Padres, Nieto), hombre(Nieto).
nieta(Nieta, Abuelos):-progenitor(Abuelos, Padres), progenitor(Padres, Nieta), mujer(Nieta).
