%INCLUDES
:-include('CrabPvP.pl'). %PvP mode
:-include('CrabPvC.pl'). %PvC mode
:-include('CrabCvC.pl'). %CvC mode

%LIBRARIES
:- use_module(library(random)). %random

%TRANSLATES
translate(space,  ' ').


crabStack:-  %GameStart function
        write('Welcome to CrabStack !!!\n By: António Melo & Ariana Fernandes'),
        write('Types of games: \n Player vs Player(0)\n Player vs Computer(1)\n Computer vs Computer(2)\n'),
        read(TypeofGame), %Read Type of game
        chooseGame(TypeofGame).

chooseGame(T):- %Pvp Mode
        T =:= 0, 
        write('PvP game starting...'),
        crabPvP.
chooseGame(T):- %PvC Mode
        T =:= 1, 
        write('PvC game starting...'),
        crabPvC.
chooseGame(T):- %CvC Mode
        T =:= 2,
        write('CvC game starting...'),
        crabCvC.



generateRandomNumber:-
        random(0,10,R),
        write(R).

generateRandomTab:-
        generateTopTab.
        %generateRandomRow(3).
/*
generateRandomRow:-
        generateRandomPiece.

generateRandomPiece.
*/
generateTopTab:-
        printSpaces(4,0),
        write('/').

printSpaces(TotalSpaces,SpacesDone):-
        SpacesDone < TotalSpaces,
        write(' s'),
        SpacesDoneN is SpacesDone+1,
        printSpaces(TotalSpaces, SpacesDoneN).

printSpaces(TotalSpaces,SpacesDone):-
        SpacesDone >= TotalSpaces.
        
        
        
        
         
        