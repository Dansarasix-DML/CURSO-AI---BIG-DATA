% Base de conocimiento
% mineral(Nombre, Color, Dureza, Fractura, Transparencia, SistemaCristalino).
mineral("Cobre nativo", "Rosa", "2.5-3", "Irregular", "Opaca", "Isometrico").
mineral("Plata", "Blanco grisaceo", "2.5-3", "Astillosa", "Opaca", "Cubico").
mineral("Aragonita", "Marron", "3.5-4", "Concoidea", "Translucido", "Ortorrombico").
mineral("Calcita Roja", "Rojo", "3", "Concoidea", "Translucido", "Hexagonal").
mineral("Malaquita", "Verde", "3.5-4", "Concoidea", "Opaca", "Monoclinico").
mineral("Smithsonita", "Variado", "4-4.5", "Irregular", "Translucido", "Trigonal").
mineral("Fluorapatito", "Incoloro", "5", "Concoidea", "Transparente", "Hexagonal").
mineral("Mimetita", "Variado", "3.5-4", "Subcocoidea", "Translucido", "Hexagonal").
mineral("Piromorfita", "Variado", "3.5-4", "Subcocoidea", "Transparente", "Hexagonal").
mineral("Fluorita", "Variado", "4", "Cuadrangular", "Translucido", "Cubico").
mineral("Cuarzo", "Blanco", "7", "Concoidea", "Transparente", "Trigonal").
mineral("Barita", "Variado", "3-3.5", "Irregular", "Transparente", "Ortorrombico").
mineral("Selenita", "Incoloro", "1.5-2", "Concoidea", "Transparente", "Monoclinico").
mineral("Bornita", "Rojo", "3-3.5", "Concoidea", "Opaca", "Tetragonal").
mineral("Esfalerita", "Amarillo", "3.5-4", "Concoidea", "Opaca", "Cubico").
mineral("Arsenico", "Gris", "3.5", "Irregular", "Opaca", "Romboedrica").
mineral("Azufre", "Amarillo", "2", "Concoidea", "Opaca", "Ortorrombico").
mineral("Bauxita", "Rojo", "1-3", "Concoidea", "Opaca", "Poroso").
mineral("Bismuto", "Rojo", "2.25", "Irregular", "Opaca", "Romboedrica").
mineral("Calcopirita", "Amarillo", "3.5-4", "Concoidea", "Opaca", "Tetragonal").
mineral("Cromatita", "Amarillo", "2", "Concoidea", "Translucido", "Tetragonal").
mineral("Diamante", "Variado", "10", "Concoidea", "Translucido", "Cubico").
mineral("Esmeralda", "Verde", "7.5-8", "Concoidea", "Translucido", "Hexagonal").
mineral("Grafito", "Gris", "1-2", "Escamosa", "Opaca", "Hexagonal").
mineral("Magnesita", "Blanco", "4-4.5", "Concoidea", "Transparente", "Trigonal").
mineral("Rubi", "Rojo", "9", "Concoidea", "Translucido", "Trigonal").

% Reglas del sistema

identificar_mineral(Color, Dureza, Fractura, Transparencia, Sistema):-
    ( mineral(Nombre, Color, Dureza, Fractura, Transparencia, Sistema) ->
        format('El mineral es: ~w~n', [Nombre])
    ;
        writeln('No se pudo identificar el mineral')
    ).
    

clasificar_mineral :-
    repeat,
    write('Introduce el color del mineral: '),
    read_line_to_string(user_input, Color),
    (Color == "" -> write('¡El color no puede estar vacío! Intenta de nuevo.'), nl, fail ; true),

    write('Introduce la dureza del mineral: '),
    read_line_to_string(user_input, Dureza),
    (Dureza == "" -> write('¡La dureza no puede estar vacía! Intenta de nuevo.'), nl, fail ; true),

    write('Introduce la fractura del mineral: '),
    read_line_to_string(user_input, Fractura),
    (Fractura == "" -> write('¡La fractura no puede estar vacía! Intenta de nuevo.'), nl, fail ; true),

    write('Introduce la transparencia del mineral: '),
    read_line_to_string(user_input, Transparencia),
    (Transparencia == "" -> write('¡La transparencia no puede estar vacía! Intenta de nuevo.'), nl, fail ; true),

    write('Introduce el sistema cristalino del mineral: '),
    read_line_to_string(user_input, Sistema),
    (Sistema == "" -> write('¡El sistema no puede estar vacío! Intenta de nuevo.'), nl, fail ; true),

    % Mostrar los valores ingresados
    format('~nResumen de entrada:~nColor: ~w~nDureza: ~w~nFractura: ~w~nTransparencia: ~w~nSistema: ~w~n~n',
           [Color, Dureza, Fractura, Transparencia, Sistema]),

    identificar_mineral(Color, Dureza, Fractura, Transparencia, Sistema),
    !.

caracteristicas_mineral :-
    repeat,
    write('Introduce el nombre del mineral: '),
    read_line_to_string(user_input, Nombre_buscado),
    (Nombre_buscado == "" ->
        write('¡El nombre no puede estar vacío! Intenta de nuevo.'), nl, fail
    ;
        ( mineral(Nombre_buscado, Color, Dureza, Fractura, Transparencia, Sistema) ->
            format('~nCaracterísticas de ~w:~n', [Nombre_buscado]),
            format('Color: ~w~n', [Color]),
            format('Dureza: ~w~n', [Dureza]),
            format('Fractura: ~w~n', [Fractura]),
            format('Transparencia: ~w~n', [Transparencia]),
            format('Sistema cristalino: ~w~n', [Sistema]),
            !
        ;
            writeln('Mineral no encontrado.'),
            !
        )
    ).

buscar_caracteristicas:-
    repeat,
    write('Introduce el color del mineral (o deja en blanco): '),
    read_line_to_string(user_input, Color),

    write('Introduce la dureza del mineral (o deja en blanco): '),
    read_line_to_string(user_input, Dureza),

    write('Introduce la fractura del mineral (o deja en blanco): '),
    read_line_to_string(user_input, Fractura),

    write('Introduce la transparencia del mineral (o deja en blanco): '),
    read_line_to_string(user_input, Transparencia),

    write('Introduce el sistema cristalino del mineral (o deja en blanco): '),
    read_line_to_string(user_input, Sistema),

    nl, writeln('Buscando coincidencias...'),

    ( mineral(Nombre, ColorM, DurezaM, FracturaM, TransparenciaM, SistemaM),
      (Color == "" ; Color == ColorM),
      (Dureza == "" ; Dureza == DurezaM),
      (Fractura == "" ; Fractura == FracturaM),
      (Transparencia == "" ; Transparencia == TransparenciaM),
      (Sistema == "" ; Sistema == SistemaM),
      format('Posible mineral: ~w~n', [Nombre]),
      fail
    ; 
      writeln('Fin de resultados.'), !
    ).

menu_sistema:-
    writeln('Bienvenido a Mineralog.'),
    writeln('--- MENU PRINCIPAL ---'),
    writeln('1. Clasificar mineral'),
    writeln('2. Obtener características de un mineral'),
    writeln('3. Listar minerales'),
    writeln('4. Salir'),
    write('Elija una opcion: '),
    read(Opcion),
    ejecutar_opcion(Opcion).

ejecutar_opcion(1) :-
    clasificar_mineral,
    menu_sistema.
ejecutar_opcion(2) :-
    caracteristicas_mineral,
    menu_sistema.
ejecutar_opcion(3) :-
    buscar_caracteristicas,
    menu_sistema.
ejecutar_opcion(4) :-
    writeln('Saliendo del programa. ¡Hasta luego!'),
    !.
ejecutar_opcion(_) :-
    writeln('Opción no válida. Intente de nuevo.'),
    menu_sistema.

