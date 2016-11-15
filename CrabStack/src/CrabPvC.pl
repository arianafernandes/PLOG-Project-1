:-include('GameLogic.pl').
:- use_module(library(system)).

:- now(Timestamp),setrand(Timestamp).

crabPvC:-
        gameInit.
