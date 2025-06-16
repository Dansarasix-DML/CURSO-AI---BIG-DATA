% Razas de perros
perro(rottweiler).
perro(mastin).
perro(bobtail).
perro(chihuahua).
perro(caniche).
perro(pequines).

% Razas de gatos
gato(siames).
gato(ragdoll).
gato(munchkin).
gato(singapura).

% Tamaño grande
grande(rottweiler).
grande(mastin).
grande(siames).
grande(ragdoll).
grande(bobtail).

% Tamaño pequeño
pequeno(chihuahua).
pequeno(singapura).
pequeno(caniche).
pequeno(pequines).
pequeno(munchkin).

% Reglas de clasificación
animal_grande(A) :- (perro(A); gato(A)), grande(A).
animal_pequeno(B) :- (perro(B); gato(B)), pequeno(B).

