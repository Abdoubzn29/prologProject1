% Predicate to add minutes to a given time [H1, M1] and return the result in [H2, M2]
add_minutes([H1, M1], Minutes, [H2, M2]) :-
    MinutesTotal is H1 * 60 + M1 + Minutes,
    H2 is MinutesTotal // 60,
    M2 is MinutesTotal mod 60.

% Predicate to display time in HH:MM format
display_time([H, M]) :-
    format('~|~`0t~d~2+:~|~`0t~d~2+\n', [H, M]).

% Predicate to check if a line passes between two stops
line_passes_stop(Arret1, Arret2, Ligne) :-
    ligne(Ligne, _, LArret, _, _),
    member([Arret1, _], LArret),
    member([Arret2, _], LArret).

% Predicate to check if a line between two stops is within schedule after adding time
line_within_schedule(Arret1, Arret2, Ligne, Horaire) :-
    ligne(Ligne, _, LArret, LTrajetAller, _),
    member([Arret1, _], LArret),
    member([Arret2, _], LArret),
    LTrajetAller = [[H, M], _, _],
    add_minutes([H, M], Horaire, NewHoraire),
    NewHoraire =< 24 * 60.

% Predicate to check if a line between two stops is within schedule for return trips after adding time
line_within_schedule_return(Arret1, Arret2, Ligne, Horaire) :-
    ligne(Ligne, _, LArret, _, LTrajetRetour),
    member([Arret1, _], LArret),
    member([Arret2, _], LArret),
    LTrajetRetour = [[H, M], _, _],
    add_minutes([H, M], -Horaire, NewHoraire),
    NewHoraire >= -24 * 60.

% Predicate to determine routes between two stops within the schedule
determine_routes_within_schedule(Arret1, Arret2, Horaire, Parcours) :-
    findall(
        [Arret1, Horaire, Arret2, Horaire],
        (line_within_schedule(Arret1, Arret2, Ligne, Horaire),
         ligne(Ligne, _, _, _, LTrajetAller),
         member([Arret2, _], LTrajetAller)),
        Parcours
    ).

% Predicate to determine routes considering delays or late departures
determine_routes_with_delay(Arret1, Arret2, Horaire, Parcours) :-
    findall(
        [Arret1, Horaire, Arret2, Horaire],
        (line_within_schedule_return(Arret1, Arret2, Ligne, Horaire),
         ligne(Ligne, _, _, _, LTrajetRetour),
         member([Arret2, _], LTrajetRetour)),
        Parcours
    ).
