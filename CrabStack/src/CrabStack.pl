%INCLUDES
:-include('CrabPvP.pl'). %PvP mode
:-include('CrabPvC.pl'). %PvC mode
:-include('CrabCvC.pl'). %CvC mode

%LIBRARIES
:- use_module(library(random)). %random


%GameStart function
crabStack:-  
        write('Welcome to CrabStack !!!\nBy: Ant�nio Melo & Ariana Fernandes\n'),
        write('Types of games: \n Player vs Player(0)\n Player vs Computer(1)\n Computer vs Computer(2)\n'),
        read(TypeofGame), %Read Type of game
        chooseGame(TypeofGame),
        exit.

chooseGame(T):- %Pvp Mode
        T =:= 0, 
        write('PvP game starting...\n'),
        crabPvP.
chooseGame(T):- %PvC Mode
        T =:= 1, 
        write('PvC game starting...\n'),
        crabPvC.
chooseGame(T):- %CvC Mode
        T =:= 2,
        write('CvC game starting...\n'),
        crabCvC.
%Exit
exit:-
        write('Game is going to exit...\n').

/*
generateRandomTab:-
        generateTopTab,
        generateDownTab.
        %generateRandomRow(3).

generateRandomRow:-
        generateRandomPiece.

generateRandomPiece.

%Generates the top Tab
generateTopTab:-
        printChar(0,5,space),
        printUnderLine,
        nl,
        printSecondLineTab(b1,b2),
        nl.
%Generates the down Tab
generateDownTab:-
        printChar(0,4,space),
        printChar(0,1,b2),
        printUnderLine,
        printChar(0,1,b1).

%Generates Second line Tab
printSecondLineTab(B1,B2):-
        printChar(0,4,space),
        printChar(0,1,B1),
        printChar(0,11,space),
        printChar(0,1,B2).

%Printes the under line      
printUnderLine:-
        printChar(0,11,under).
       


 
%Prints a TotalChars number of C char
printChar(CharsDone,TotalChars,C):-
        CharsDone < TotalChars,
        translate(C,S),
        write(S),
        SpacesDoneN is CharsDone+1,
        printChar(SpacesDoneN, TotalChars,C).
printChar(CharsDone,TotalChars,C):-
        CharsDone >= TotalChars.*/     