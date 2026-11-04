
% Lab 9 - Name Game

start :-
    menu([a,b,c]).

menu(Letters) :-
    nl,
    writeln('Hi. This is the Name Game.'),
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
    action(Choice, Letters).

action(1, Letters) :-
    writeln(Letters),
    menu(Letters).

action(2, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    menu(NewLetters).

action(3, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    menu([Letter|Letters]).

action(4, Letters) :-
    write('Enter a letter: '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    menu(NewLetters).

action(5, Letters) :-
    write('Enter the letter to delete: '),
    read(Letter),
    ( select(Letter, Letters, NewLetters) ->
        menu(NewLetters)
    ;
        writeln('Letter not found'),
        menu(Letters)
    ).

action(6, _) :-
    menu([]).

action(7, _) :-
    writeln('Goodbye!').

action(_, Letters) :-
    writeln('Invalid choice!'),
    menu(Letters).
