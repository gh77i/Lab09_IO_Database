
% Lab 9 - Name Game
% Database Manipulation

:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    menu.

menu :-
    nl,
    writeln('Hi. This is the Name Game.'),
    writeln('You will be given a set of English letters.'),
    writeln('Choose from the following:'),
    writeln('1- Display the current set of letters'),
    writeln('2- Add a letter'),
    writeln('3- Add a letter at the top'),
    writeln('4- Add a letter at the bottom'),
    writeln('5- Delete a letter'),
    writeln('6- Delete all letters'),
    writeln('7- Exit'),
    write('Enter your choice: '),
    read(Choice),
    action(Choice).

action(1) :-
    findall(L, letter(L), Letters),
    writeln(Letters),
    menu.

action(2) :-
    read_letter(L),
    ( valid_letter(L) ->
        assertz(letter(L)),
        writeln('Letter added.')
    ;
        writeln('Please enter one letter.')
    ),
    menu.

action(3) :-
    read_letter(L),
    ( valid_letter(L) ->
        asserta(letter(L)),
        writeln('Letter added at the top.')
    ;
        writeln('Please enter one letter.')
    ),
    menu.

action(4) :-
    read_letter(L),
    ( valid_letter(L) ->
        assertz(letter(L)),
        writeln('Letter added at the bottom.')
    ;
        writeln('Please enter one letter.')
    ),
    menu.

action(5) :-
    read_letter(L),
    ( retract(letter(L)) ->
        writeln('Letter deleted.')
    ;
        writeln('Letter not found.')
    ),
    menu.

action(6) :-
    retractall(letter(_)),
    writeln('All letters deleted.'),
    menu.

action(7) :-
    writeln('Goodbye!').

action(_) :-
    writeln('Invalid choice.'),
    menu.

read_letter(L) :-
    write('Enter a letter: '),
    read(L).

valid_letter(L) :-
    atom(L),
    atom_length(L, 1).
