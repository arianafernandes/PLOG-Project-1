/* Board of Crab etack*/

%a - empty space  ' ' 
%e - empty space initial
%b1 - / 
%b2 - \ 
%b3 - |
%c - central hole '  '
%o - empty space after game start

%s1 - player1 piece small 
%m1 - player1 piece medium
%l1 - player1 piece large

%s2 - player1 piece small 
%m2 - player1 piece medium
%l2 - player1 piece large


/* Empty Board */
empty_board([
           [a, a, a, a, b1, a, a, a, a, a, a, a, a, a, a, a, b2], %17
           [a, a, a, b1, a, a, e, e, e, a, a, b2], %12
           [a, a, b1, a, a, e, e, e, e, a, b2], %11
           [a, b3, a, a, e, e, c, e, e, a, b3], %11
           [a, a, b2, a, a, e, e, e, e, a, b1], %11
           [a, a, a, b2, a, a, e, e, e, a, a, b1], %12
           [a, a, a,  a, b2, a, a, a, a, a, a, a, a, a, a, a, b1] %17
          ]).


/* Initial Random Board */
initial_board([
           [a, a, a, a, b1, a, a, a, a, a, a, a, a, a, a, a, b2],
           [a, a, a,  b1, a, a, s1, s1, s1, a, a, b2],
           [a, a, b1, a, a, m1, m1, m1, l1, a,  b2],
           [a, b3, a, a, l1, l1, c, s2, s2, a, b3],
           [a, a, b2, a , a, s2, m2, m2, m2, a, b1],
           [a, a, a,  b2, a, a, l2, l2, l2, a, a, b1],
           [a, a, a, a, b2, a , a, a, a, a, a, a, a, a, a, a, b1]
          ]).

initial_list_board([
           [a, a, a, a, a, a, a, a, a, a, a, a, a, a, a],
           [a, a, a, a, a, [s1,a], [s1|a], [s1|a], a, a],
           [a, a, a, a, [m1|a], [m1|a], [m1|a], [l1|a], a],
           [a, a, a, [l1|a], [l1|a], c, [s2|a], [s2|a], a],
           [a, a, a , a, [s2|a], [m2|a], [m2|a], [m2|a], a],
           [a, a, a, a, a, [l2|a], [l2|a], [l2|a], a, a],
           [a, a, a, a, a , a, a, a, a, a, a, a, a, a, a]
          ]).

/* Game Board */
game_board([
           [a, a, a, a, b1, a, a, a, a, a, a, a, a, a, a, a, b2],
           [a, a, a, b1, a, a, s2, s2, s1, a, a, b2],
           [a, a, b1, a, a, m2, o, m1, o, a, b2],
           [a, b3, a, a, o, l2, c, o, l2, a, b3],
           [a, a, b2, a, a, l2, s1, o, l1, a, b1],
           [a, a, a, b2, a, a, s1, l1, l1, a, a, b1],
           [a, a, a, a, b2, a, a, a, a, a, a, a, a, a, a, a, b1]
          ]).

/* Final Game Board */
final_game_board([
           [a, a, a, a, b1, a, a, a, a, a, a, a, a,  a, a, a, b2],
           [a, a, a, b1, a , a, o, o, o, a, a, b2],
           [a, a, b1, a , a, m2, l2, o, o, a, b2],
           [a, b3, a, a, l2, s1, c, o, o, a, b3],
           [a, a, b2, a, a, o, o, o, o, a, b1],
           [a, a, a, b2, a, a, o, o, o, a, a, b1],
           [a, a, a, a, b2, a, a, a, a, a, a, a, a, a, a, a, b1]
          ]).


display:-initial_list_board(T), display_top, display_board(T).

display_board([]):-display_bottom.
display_row([]).


display_top:- write('     ___________'), nl.
display_bottom:- write('     -----------').

display_board([L1|Le]):-
        display_row(L1),
        nl,
        display_board(Le).

display_row([E|Ee]):-
        display_element([E|Ee]),
        display_row(Ee).

display_element([E|Ee]) :-
        translate(E,V),
        write(V),
        nl,
        display_element(Ee).


translate(a,  ' ').
translate(e,  'e  ').
translate(b1, '/').
translate(b2, '\\').
translate(b3, '|').
translate(c,  '  ').
translate(o,  'O  ').

translate(s1, '1s ').
translate(m1, '1m ').
translate(l1, '1L ').

translate(s2, '2s ').
translate(m2, '2m ').
translate(l2, '2L ').




/*
atomlength(Atomo,1):-
        name(Atomo,[_]).
atomlength(Atomo,2):-
        name(Atomo,[_,_]).
atomlength(Atomo,3):-
        name(Atomo,[_,_,_]).


completeCell(Atomo,Cell):-
        name(Atomo,[L]),
        name(Cell,[32,L]).
completeCell(Atomo,Cell):-
        name(Atomo,[c1,c2]),
        name(Cell,[c1,c2]).

completeCell(Atomo,Cell):-
        name(Atomo,[c1,c2,c3]),
        name(Cell,[c1,c2,c3]).*/
        
        
