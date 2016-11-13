%Includes
:-include('utils.pl'). %Utils

%LIBRARIES
:- use_module(library(lists)). %lists
:- use_module(library(random)). %random

%Game Initializer 
gameInit:-board(T),
        write('Placing Player1 Pieces\n'),   
        positionPlayerPieces(1,T).
        %positionPlayerPieces(2,T).

%Place Player Pieces int the board
positionPlayerPieces(N,T):-
        write('Placing Player1 SmallPieces\n'),
        positionSmallPiecies(N,T).
        %positionMediumPiecies(N,T),
        %positionLargePiecies(N,T).

%Place Small Player Piecies 
positionSmallPiecies(N,T):-
        write('Placing Player1 SmallPiece\n'),
        placeSmallPiece(N,T,0),
        placeSmallPiece(N,T,0),
        placeSmallPiece(N,T,0).

placeSmallPiece(N,T,Placed):-
         Placed == 0,
         write('Vou gerar um posição\n'),
         generateRandomNumber(X,Y),
         write('Gerei um posição\n'),
         write(X),
         write(Y),
         getCell(X,Y,T,[C]),
         write(C),
         ((C == empty)->(
                write('\nEncontrei uma celula vazia\n'),                           
                emptyCell(X,Y,T,NewT),
                write('Limpei a casa\n'), 
                setCell(X,Y,NewT,[s1],NewT2),
                write('Dei set\n'), 
                getCell(X,Y,NewT2,[B]),
                write(B),
                NewPlaced is 1,
                placeSmallPiece(N,T,NewPlaced)); (placeSmallPiece(N,T,Placed))).
         

placeSmallPiece(N,T,Placed):-
         Placed == 1.      

%Generates a random Coord(X,Y) [1,5]
generateRandomNumber(X,Y):-
        random(1,5,X),
        random(1,5,Y).


equalPosition(X,Y,Z,X1,Y1,Z1):-
        ((X == X1)->((Y == Y1)->((Z == Z1)->true))).        
        


%Temporary funtions
/*
printPosition(X,Y):-
        board(T),
        nth0(X, T, Row),
        nth0(Y, Row, Elem),
        nth0(0, Elem, Elem0),
        translate(Elem0,C),
        write(C).

displayB:- 
        board(T),
        display_board(T),*/     